import '../models/api_error.dart';

/// Exception class representing errors that occur during API interactions.
class ApiException implements Exception {
  /// The error message associated with the exception.
  final String message;

  /// The error response data received from the API.
  final ErrorResponse? errorResponse;

  /// Creates an [ApiException] with the provided error message and optional error response.
  ///
  /// The [message] parameter is a human-readable error description.
  /// The [errorResponse] parameter contains detailed error information from the API, if available.
  ApiException(this.message, {this.errorResponse});
}
