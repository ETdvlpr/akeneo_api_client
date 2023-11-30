import 'link.dart';

// Represents a family in Akeneo
class Family {
  final Links? links;
  final String code;
  final List<String> attributes;
  final String? attributeAsLabel;
  final String? attributeAsImage;
  final Map<String, List<String>> attributeRequirements;
  final Map<String, String?> labels;

  const Family({
    this.links,
    required this.code,
    required this.attributes,
    this.attributeAsLabel,
    this.attributeAsImage,
    this.attributeRequirements = const {},
    this.labels = const {},
  });

  /// Creates an instance of [Family] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory Family.fromJson(Map<String, dynamic> json) {
    return Family(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      attributeAsLabel: json['attribute_as_label'] as String?,
      attributeAsImage: json['attribute_as_image'] as String?,
      attributeRequirements:
          (json['attribute_requirements'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    k, (e as List<dynamic>).map((e) => e as String).toList()),
              ) ??
              const {},
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );
  }

  /// Converts this [Family] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'code': code,
      'attributes': attributes,
      'attribute_as_label': attributeAsLabel,
      'attribute_as_image': attributeAsImage,
      'attribute_requirements': attributeRequirements,
      'labels': labels,
    };
  }

  /// Creates a copy of this [Family] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Family copyWith({
    Links? links,
    String? code,
    List<String>? attributes,
    String? attributeAsLabel,
    String? attributeAsImage,
    Map<String, List<String>>? attributeRequirements,
    Map<String, String?>? labels,
  }) {
    return Family(
      links: links ?? this.links,
      code: code ?? this.code,
      attributes: attributes ?? this.attributes,
      attributeAsLabel: attributeAsLabel ?? this.attributeAsLabel,
      attributeAsImage: attributeAsImage ?? this.attributeAsImage,
      attributeRequirements:
          attributeRequirements ?? this.attributeRequirements,
      labels: labels ?? this.labels,
    );
  }
}
