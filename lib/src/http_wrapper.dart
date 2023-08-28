import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class HttpWrapper {
  final Uri endpoint;
  final String clientId;
  final String clientSecret;
  final String userName;
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

  Future<http.Response> put(String path, Map<String, dynamic> data) {
    return _authenticatedRequest(
      (accessToken) => http.put(
        endpoint.resolve(path),
        body: json.encode(data),
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
  }

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

  Future<http.Response> delete(String path) {
    return _authenticatedRequest(
      (accessToken) => http.delete(
        endpoint.resolve(path),
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
  }

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

  Future<http.Response> postFile({
    required String url,
    required String filePath,
    required Map<String, Map<String, String?>> payload,
    void Function(int, int)? onProgress,
  }) async {
    await _refreshToken();

    final request = http.MultipartRequest('POST', Uri.parse(url));

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
