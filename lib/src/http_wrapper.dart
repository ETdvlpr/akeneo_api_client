import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// A wrapper for making authenticated HTTP requests to an Akeneo API endpoint.
class HttpWrapper {
  /// The base URL of the Akeneo instance.
  final Uri endpoint;

  /// The client ID for authentication.
  final String clientId;

  /// The client secret for authentication.
  final String clientSecret;

  /// The username for authentication.
  final String userName;

  /// The password for authentication.
  final String password;

  String? accessToken;
  String? refreshToken;

  HttpWrapper({
    required this.endpoint,
    required this.clientId,
    required this.clientSecret,
    required this.userName,
    required this.password,
  });

  /// Refreshes the access token by making a request to the Akeneo API.
  /// if the refresh token is null, it will use the username and password to get a new token
  Future<void> _refreshToken() async {
    final response = await http.post(
      endpoint.resolve('api/oauth/v1/token'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
      },
      body: refreshToken != null
          ? json.encode({
              'grant_type': 'refresh_token',
              'refresh_token': refreshToken,
            })
          : json.encode({
              'grant_type': 'password',
              'username': userName,
              'password': password,
            }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      accessToken = data['access_token'];
      refreshToken = data['refresh_token'];
    } else {
      throw Exception('Failed to authenticate user');
    }
  }

  /// Performs an authenticated HTTP request and handles token refreshing.
  Future<http.Response> _authenticatedRequest(
    Future<http.Response> Function(String accessToken) requestFunction,
  ) async {
    if (accessToken == null) {
      await _refreshToken();
    }

    var response = await requestFunction(accessToken!);

    if (response.statusCode == 401) {
      await _refreshToken();
      response = await requestFunction(accessToken!);
    }

    return response;
  }

  /// Performs an authenticated GET request.
  Future<http.Response> get(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _authenticatedRequest((accessToken) async {
      final Uri uri = Uri(
        scheme: endpoint.scheme,
        host: endpoint.host,
        path: path,
        queryParameters: queryParameters,
      );

      return await http.get(uri, headers: {
        'Authorization': 'Bearer $accessToken',
      });
    });
  }

  /// Performs an authenticated PUT request.
  Future<http.Response> put(String path, Map<String, dynamic> data) {
    return _authenticatedRequest(
      (accessToken) => http.put(
        endpoint.resolve(path),
        body: json.encode(data),
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
  }

  /// Performs an authenticated PATCH request.
  Future<http.Response> patch(String path, Map<String, dynamic> data) {
    //remove null values from data
    data.removeWhere((key, value) => value == null);
    //remove links from payload if present
    data.remove('links');
    return _authenticatedRequest(
      (accessToken) => http.patch(
        endpoint.resolve(path),
        body: json.encode(data),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  /// Performs an authenticated DELETE request.
  Future<http.Response> delete(String path) {
    return _authenticatedRequest(
      (accessToken) => http.delete(
        endpoint.resolve(path),
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
  }

  /// Performs an authenticated POST request.
  Future<http.Response> post(String path, Map<String, dynamic> data) {
    //remove null values from data
    data.removeWhere((key, value) => value == null);
    //remove links from payload if present
    data.remove('links');
    return _authenticatedRequest(
      (accessToken) => http.post(
        endpoint.resolve(path),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      ),
    );
  }

  /// Performs an authenticated POST request with a file.
  Future<http.Response> postFile({
    required String url,
    required String filePath,
    required Map<String, Map<String, String?>> payload,
    void Function(int, int)? onProgress,
  }) async {
    await _refreshToken();

    final request = http.MultipartRequest('POST', endpoint.resolve(url));

    // Add authorization header
    request.headers['Authorization'] = 'Bearer $accessToken';

    // Add other fields to the request
    for (var field in payload.entries) {
      for (var value in field.value.entries) {
        request.fields[field.key] = value.value!;
      }
    }

    // Add the file to the request
    final file = File(filePath);
    final fileStream = http.ByteStream(file.openRead());
    final length = await file.length();
    final filename = file.path.split('/').last;

    final multipartFile =
        http.MultipartFile('file', fileStream, length, filename: filename);

    final completer = Completer<void>();
    int totalBytesSent = 0;

    final subscription = multipartFile.finalize().listen(
      (bytes) {
        totalBytesSent += bytes.length;
        onProgress?.call(totalBytesSent, length);
      },
      onDone: () {
        completer.complete();
      },
      onError: (error) {
        completer.completeError(error);
      },
    );

    request.files.add(multipartFile);
    final response = await request.send();

    await completer.future; // Wait for the stream to complete before proceeding
    await subscription.cancel(); // Cancel the subscription

    return http.Response.fromStream(response);
  }
}
