import 'link.dart';

/// Represents an attribute group in Akeneo.
class AttributeGroup {
  final Links? links;
  final String code;
  final int? sortOrder;
  final List<String>? attributes;
  final Map<String, String?> labels;

  const AttributeGroup({
    this.links,
    required this.code,
    this.sortOrder,
    this.attributes,
    this.labels = const {},
  });

  /// Creates an instance of [AttributeGroup] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory AttributeGroup.fromJson(Map<String, dynamic> json) {
    return AttributeGroup(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      sortOrder: json['sort_order'] as int?,
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );
  }

  /// Converts this [AttributeGroup] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'code': code,
      'sort_order': sortOrder,
      'attributes': attributes,
      'labels': labels,
    };
  }

  /// Creates a copy of this [AttributeGroup] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  AttributeGroup copyWith({
    Links? links,
    String? code,
    int? sortOrder,
    List<String>? attributes,
    Map<String, String?>? labels,
  }) {
    return AttributeGroup(
      links: links ?? this.links,
      code: code ?? this.code,
      sortOrder: sortOrder ?? this.sortOrder,
      attributes: attributes ?? this.attributes,
      labels: labels ?? this.labels,
    );
  }
}
