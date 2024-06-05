import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:akeneo_api_client/akeneo_api_client.dart';
import 'package:akeneo_api_client/src/exceptions/network_exceptions.dart';
import 'package:http/http.dart' as http;

/// A wrapper class for making authenticated HTTP requests to an API.
///
/// This class handles OAuth2 authentication, including obtaining and refreshing
/// access tokens. It provides methods for making various types of HTTP requests
/// (GET, POST, PUT, PATCH, DELETE) and supports uploading files with progress tracking.
class HttpWrapper {
  /// The base endpoint URI for the API.
  final Uri endpoint;

  /// The client ID for OAuth2 authentication.
  final String clientId;

  /// The client secret for OAuth2 authentication.
  final String clientSecret;

  /// The username for OAuth2 password grant authentication.
  final String userName;

  /// The password for OAuth2 password grant authentication.
  final String password;

  /// Whether to print debug information, such as curl commands.
  final bool debug;

  /// The current OAuth2 access token.
  String? accessToken;

  /// The current OAuth2 refresh token.
  String? refreshToken;

  /// Creates an instance of [HttpWrapper].
  ///
  /// The [endpoint], [clientId], [clientSecret], [userName], and [password] parameters
  /// are required. The [debug] parameter is optional and defaults to `false`.
  HttpWrapper({
    required this.endpoint,
    required this.clientId,
    required this.clientSecret,
    required this.userName,
    required this.password,
    this.debug = false,
  });

  /// Refreshes the OAuth2 access token.
  ///
  /// This method will use the refresh token if available, otherwise it will use the
  /// username and password to obtain a new access token.
  Future<void> _refreshToken() async {
    final body = {
      'grant_type': refreshToken != null ? 'refresh_token' : 'password',
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (refreshToken == null) 'username': userName,
      if (refreshToken == null) 'password': password,
    };

    if (debug) {
      _printCurlCommand(
          method: 'POST',
          uri: endpoint.resolve('api/oauth/v1/token'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
          },
          body: json.encode(body));
    }

    final response = await http.post(
      endpoint.resolve('api/oauth/v1/token'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      accessToken = data['access_token'];
      refreshToken = data['refresh_token'];
    } else {
      throw Exception('Failed to authenticate user: ${response.body}');
    }
  }

  /// Makes an authenticated HTTP request.
  ///
  /// The [requestFunction] parameter is a function that takes the access token
  /// and returns a [Future] of [http.Response]. This method will handle refreshing
  /// the token if necessary.
  Future<http.Response> _authenticatedRequest(
      Future<http.Response> Function(String accessToken)
          requestFunction) async {
    try {
      if (accessToken == null) {
        await _refreshToken();
      }

      var response = await requestFunction(accessToken!);

      if (response.statusCode == 401) {
        await _refreshToken();
        response = await requestFunction(accessToken!);
      }

      return response;
    } catch (error) {
      log(error.toString(), error: error, stackTrace: StackTrace.current);
      //if error is a ApiError
      if (error is ErrorResponse) {
        throw ApiException('Api Error: ${error.message}', errorResponse: error);
      }
      throw NetworkExceptions.getHttpException(error);
    }
  }

  /// Builds a URI with the given [path] and optional [queryParameters].
  Uri _buildUri(String path, [Map<String, dynamic>? queryParameters]) {
    return Uri(
      scheme: endpoint.scheme,
      host: endpoint.host,
      path: path,
      queryParameters:
          queryParameters?.map((key, value) => MapEntry(key, value.toString())),
    );
  }

  /// Makes an HTTP request with the specified [method], [path], and optional parameters.
  ///
  /// The [data] parameter is the request body for methods that support it (e.g., POST, PUT, PATCH).
  /// The [queryParameters] parameter is the query string parameters for the request.
  /// The [hasBody] parameter indicates if the request has a body.
  Future<http.Response> _makeRequest({
    required String method,
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool hasBody = false,
  }) {
    return _authenticatedRequest((accessToken) async {
      final uri = _buildUri(path, queryParameters);
      final headers = {
        'Authorization': 'Bearer $accessToken',
        if (hasBody) 'Content-Type': 'application/json',
      };

      if (debug) {
        _printCurlCommand(
            method: method,
            uri: uri,
            headers: headers,
            body: hasBody ? json.encode(data) : null);
      }

      switch (method) {
        case 'GET':
          return await http.get(uri, headers: headers);
        case 'POST':
          return await http.post(uri,
              headers: headers, body: json.encode(data));
        case 'PUT':
          return await http.put(uri, headers: headers, body: json.encode(data));
        case 'PATCH':
          return await http.patch(uri,
              headers: headers, body: json.encode(data));
        case 'DELETE':
          return await http.delete(uri, headers: headers);
        default:
          throw UnsupportedError('Unsupported HTTP method: $method');
      }
    });
  }

  /// Makes a GET request to the specified [path] with optional [queryParameters].
  Future<http.Response> get(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _makeRequest(
        method: 'GET', path: path, queryParameters: queryParameters);
  }

  /// Makes a PUT request to the specified [path] with the given [data].
  Future<http.Response> put(String path, Map<String, dynamic> data) {
    return _makeRequest(method: 'PUT', path: path, data: data, hasBody: true);
  }

  /// Makes a PATCH request to the specified [path] with the given [data].
  Future<http.Response> patch(String path, Map<String, dynamic> data) {
    data
      ..removeWhere((key, value) => value == null)
      ..remove('links');
    return _makeRequest(method: 'PATCH', path: path, data: data, hasBody: true);
  }

  /// Makes a DELETE request to the specified [path].
  Future<http.Response> delete(String path) {
    return _makeRequest(method: 'DELETE', path: path);
  }

  /// Makes a POST request to the specified [path] with the given [data].
  Future<http.Response> post(String path, Map<String, dynamic> data) {
    data
      ..removeWhere((key, value) => value == null)
      ..remove('links');
    return _makeRequest(method: 'POST', path: path, data: data, hasBody: true);
  }

  /// Makes a POST request to upload a file with the given [url] and [filePath].
  ///
  /// The [payload] parameter contains additional form fields to include in the request.
  /// The [onProgress] parameter is a callback function that receives the number of bytes
  /// sent and the total file size to track the upload progress.
  Future<http.Response> postFile({
    required String url,
    required String filePath,
    required Map<String, Map<String, String?>> payload,
    void Function(int, int)? onProgress,
  }) async {
    await _refreshToken();

    final request = http.MultipartRequest('POST', endpoint.resolve(url))
      ..headers['Authorization'] = 'Bearer $accessToken';

    payload.forEach((fieldKey, fields) {
      fields.forEach((key, value) {
        if (value != null) request.fields[key] = value;
      });
    });

    final file = File(filePath);
    final length = await file.length();
    final multipartFile = http.MultipartFile('file', file.openRead(), length,
        filename: file.path.split('/').last);

    int totalBytesSent = 0;
    final subscription = multipartFile.finalize().listen(
      (bytes) {
        totalBytesSent += bytes.length;
        onProgress?.call(totalBytesSent, length);
      },
    );

    request.files.add(multipartFile);
    final response = await request.send();

    await subscription.asFuture();
    return http.Response.fromStream(response);
  }

  /// Prints a curl command for debugging purposes.
  ///
  /// The [method] parameter specifies the HTTP method.
  /// The [uri] parameter is the request URI.
  /// The [headers] parameter is the request headers.
  /// The [body] parameter is the request body (if any).
  void _printCurlCommand({
    required String method,
    required Uri uri,
    required Map<String, String> headers,
    String? body,
  }) {
    final curlCommand = StringBuffer()
      ..write('curl -X $method \'${uri.toString()}\' ');

    headers.forEach((key, value) {
      curlCommand.write('-H \'$key: $value\' ');
    });

    if (body != null) {
      curlCommand.write('-d \'$body\' ');
    }

    print(curlCommand.toString());
  }
}
