import 'link.dart';

// Represents a category in Akeneo
class Category {
  final String code;
  final String? parent;
  final Map<String, String?> labels;
  final Links? links;

  const Category({
    required this.code,
    this.parent,
    this.labels = const {},
    this.links,
  });

  /// Creates an instance of [Category] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      code: json['code'] as String,
      parent: json['parent'] as String?,
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );
  }

  /// Converts this [Category] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'parent': parent,
      'labels': labels,
      '_links': links?.toJson(),
    };
  }

  /// Creates a copy of this [Category] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Category copyWith({
    String? code,
    String? parent,
    Map<String, String?>? labels,
    Links? links,
  }) {
    return Category(
      code: code ?? this.code,
      parent: parent ?? this.parent,
      labels: labels ?? this.labels,
      links: links ?? this.links,
    );
  }
}
