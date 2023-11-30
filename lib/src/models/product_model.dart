import 'link.dart';
import 'value.dart';

// Represents a product model in Akeneo
class ProductModel {
  final Links? links;
  final String code;
  final String familyVariant;
  final String? parent;
  final List<String> categories;
  final Map<String, List<Value>> values;

  const ProductModel({
    this.links,
    required this.code,
    required this.familyVariant,
    this.parent,
    this.categories = const [],
    this.values = const {},
  });

  /// Creates an instance of [ProductModel] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      familyVariant: json['family_variant'] as String,
      parent: json['parent'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      values: (json['values'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k,
                (e as List<dynamic>)
                    .map((e) => Value.fromJson(e as Map<String, dynamic>))
                    .toList()),
          ) ??
          const {},
    );
  }

  /// Converts this [ProductModel] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'code': code,
      'family_variant': familyVariant,
      'parent': parent,
      'categories': categories,
      'values': values.map<String, dynamic>(
          (key, value) => MapEntry(key, value.map((v) => v.toJson()).toList())),
    };
  }

  /// Creates a copy of this [ProductModel] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  ProductModel copyWith({
    Links? links,
    String? code,
    String? familyVariant,
    String? parent,
    List<String>? categories,
    Map<String, List<Value>>? values,
  }) {
    return ProductModel(
      links: links ?? this.links,
      code: code ?? this.code,
      familyVariant: familyVariant ?? this.familyVariant,
      parent: parent ?? this.parent,
      categories: categories ?? this.categories,
      values: values ?? this.values,
    );
  }
}
