import 'package:akeneo_api_client/src/models/link.dart';

/// Represents a value in Akeneo.
class Value {
  final String? locale;
  final String? scope;
  final dynamic data;
  final Links? links;

  Value({
    this.locale,
    this.scope,
    this.data,
    this.links,
  });

  /// Creates an instance of [Value] from a JSON [Map].
  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      locale: json['locale'] as String?,
      scope: json['scope'] as String?,
      data: json['data'],
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );
  }

  /// Converts this [Value] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'locale': locale,
      'scope': scope,
      'data': data,
      'links': links?.toJson(),
    };
  }

  /// Creates a copy of this [Value] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Value copyWith({
    String? locale,
    String? scope,
    dynamic data,
    Links? links,
  }) {
    return Value(
      locale: locale ?? this.locale,
      scope: scope ?? this.scope,
      data: data ?? this.data,
      links: links ?? this.links,
    );
  }
}
