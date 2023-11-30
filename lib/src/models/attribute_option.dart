import 'link.dart';

// Represents an attribute option in Akeneo
class AttributeOption {
  final Links? links;
  final String code;
  final String attribute;
  final int sortOrder;
  final Map<String, String?> labels;

  const AttributeOption({
    this.links,
    required this.code,
    required this.attribute,
    this.sortOrder = 0,
    this.labels = const {},
  });

  /// Creates an instance of [AttributeOption] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory AttributeOption.fromJson(Map<String, dynamic> json) {
    return AttributeOption(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      attribute: json['attribute'] as String,
      sortOrder: json['sort_order'] as int? ?? 0,
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );
  }

  /// Converts this [AttributeOption] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'code': code,
      'attribute': attribute,
      'sort_order': sortOrder,
      'labels': labels,
    };
  }

  /// Creates a copy of this [AttributeOption] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  AttributeOption copyWith({
    Links? links,
    String? code,
    String? attribute,
    int? sortOrder,
    Map<String, String?>? labels,
  }) {
    return AttributeOption(
      links: links ?? this.links,
      code: code ?? this.code,
      attribute: attribute ?? this.attribute,
      sortOrder: sortOrder ?? this.sortOrder,
      labels: labels ?? this.labels,
    );
  }
}
