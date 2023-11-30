import 'link.dart';

/// Represents an error response returned from the API.
///
/// This class contains information about the error, including the error code,
/// error message, links, and a list of API errors if applicable.
class ErrorResponse {
  final int code;
  final String message;
  final Links? links;
  final List<ApiError>? errors;

  const ErrorResponse({
    required this.code,
    required this.message,
    this.links,
    this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ApiError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts this [ErrorResponse] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      '_links': links?.toJson(),
      'errors': errors?.map((error) => error.toJson()).toList(),
    };
  }

  /// Creates a copy of this [ErrorResponse] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  ErrorResponse copyWith({
    int? code,
    String? message,
    Links? links,
    List<ApiError>? errors,
  }) {
    return ErrorResponse(
      code: code ?? this.code,
      message: message ?? this.message,
      links: links ?? this.links,
      errors: errors ?? this.errors,
    );
  }
}

/// Represents an API error in Akeneo.
/// This class contains information about the property, message, attribute,
/// a list of ApiErrors is returned in an error response
class ApiError {
  final String? property;
  final String? message;
  final String? attribute;
  final String? locale;
  final String? scope;

  const ApiError({
    this.property,
    this.message,
    this.attribute,
    this.locale,
    this.scope,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      property: json['property'] as String?,
      message: json['message'] as String?,
      attribute: json['attribute'] as String?,
      locale: json['locale'] as String?,
      scope: json['scope'] as String?,
    );
  }

  /// Converts this [ApiError] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'property': property,
      'message': message,
      'attribute': attribute,
      'locale': locale,
      'scope': scope,
    };
  }
}
