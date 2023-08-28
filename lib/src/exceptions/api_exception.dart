import 'package:akeneo_api_client/src/models/freezed_models.dart';

class ApiException implements Exception {
  final String message;
  final ErrorResponse? errorResponse;

  ApiException(this.message, {this.errorResponse});
}
