import 'dart:async';
import 'dart:io';

/// A class for representing network-related exceptions.
class NetworkExceptions implements Exception {
  /// The error message associated with the exception.
  final String message;

  /// Constructs a [NetworkExceptions] instance with the given [message].
  NetworkExceptions(this.message);

  /// Creates a [NetworkExceptions] instance for a request cancellation.
  factory NetworkExceptions.requestCancelled() {
    return NetworkExceptions("Request Cancelled");
  }

  /// Creates a [NetworkExceptions] instance for an unauthorized request.
  factory NetworkExceptions.unauthorisedRequest() {
    return NetworkExceptions("Unauthorised Request");
  }

  /// Creates a [NetworkExceptions] instance for a bad request.
  factory NetworkExceptions.badRequest() {
    return NetworkExceptions("Bad Request");
  }

  /// Creates a [NetworkExceptions] instance for a resource not found.
  factory NetworkExceptions.notFound(String reason) {
    return NetworkExceptions("Not Found: $reason");
  }

  /// Creates a [NetworkExceptions] instance for a method not allowed.
  factory NetworkExceptions.methodNotAllowed() {
    return NetworkExceptions("Method Not Allowed");
  }

  /// Creates a [NetworkExceptions] instance for a not acceptable response.
  factory NetworkExceptions.notAcceptable() {
    return NetworkExceptions("Not Acceptable");
  }

  /// Creates a [NetworkExceptions] instance for a request timeout.
  factory NetworkExceptions.requestTimeout() {
    return NetworkExceptions("Request Timeout");
  }

  /// Creates a [NetworkExceptions] instance for a conflict.
  factory NetworkExceptions.conflict() {
    return NetworkExceptions("Conflict");
  }

  /// Creates a [NetworkExceptions] instance for an internal server error.
  factory NetworkExceptions.internalServerError() {
    return NetworkExceptions("Internal Server Error");
  }

  /// Creates a [NetworkExceptions] instance for a not implemented error.
  factory NetworkExceptions.notImplemented() {
    return NetworkExceptions("Not Implemented");
  }

  /// Creates a [NetworkExceptions] instance for a service unavailable error.
  factory NetworkExceptions.serviceUnavailable() {
    return NetworkExceptions("Service Unavailable");
  }

  /// Creates a [NetworkExceptions] instance for a no internet connection error.
  factory NetworkExceptions.noInternetConnection() {
    return NetworkExceptions("No Internet Connection");
  }

  /// Creates a [NetworkExceptions] instance for a format exception error.
  factory NetworkExceptions.formatException() {
    return NetworkExceptions("Format Exception");
  }

  /// Creates a [NetworkExceptions] instance for an unable to process error.
  factory NetworkExceptions.unableToProcess() {
    return NetworkExceptions("Unable to Process");
  }

  /// Creates a [NetworkExceptions] instance for a default error with the given [error] message.
  factory NetworkExceptions.defaultError(String error) {
    return NetworkExceptions("Default Error: $error");
  }

  /// Creates a [NetworkExceptions] instance for an unexpected error.
  factory NetworkExceptions.unexpectedError() {
    return NetworkExceptions("Unexpected Error");
  }

  /// Creates a [NetworkExceptions] instance for a socket exception.
  factory NetworkExceptions.socketException() {
    return NetworkExceptions("Socket Exception Occurred");
  }

  /// Converts the given [error] into a [NetworkExceptions] instance.
  ///
  /// This method attempts to map different types of errors to specific network exceptions.
  static NetworkExceptions getHttpException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else if (error is TimeoutException) {
          networkExceptions = NetworkExceptions.requestTimeout();
        } else if (error is HttpException) {
          switch (error.message) {
            case 'Not Found':
              networkExceptions = NetworkExceptions.notFound('Not Found');
              break;
            case 'Unauthorized':
              networkExceptions = NetworkExceptions.unauthorisedRequest();
              break;
            case 'Forbidden':
              networkExceptions = NetworkExceptions.unauthorisedRequest();
              break;
            default:
              networkExceptions = NetworkExceptions.defaultError(error.message);
          }
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return NetworkExceptions.formatException();
      } catch (_) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      return NetworkExceptions.unexpectedError();
    }
  }

  /// Gets the error message associated with the given [networkExceptions].
  static String getErrorMessage(NetworkExceptions networkExceptions) {
    return networkExceptions.message;
  }
}
