import 'link.dart';
import 'value.dart';

// Represents a product in Akeneo
class Product {
  final Links? links;
  final String identifier;
  final bool? enabled;
  final String? family;
  final List<String> categories;
  final List<String> groups;
  final String? parent;
  final Map<String, List<Value>> values;
  final String? created;
  final String? updated;

  const Product({
    this.links,
    required this.identifier,
    this.enabled,
    this.family,
    this.categories = const [],
    this.groups = const [],
    this.parent,
    this.values = const {},
    this.created,
    this.updated,
  });

  /// Creates an instance of [Product] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      identifier: json['identifier'] as String,
      enabled: json['enabled'] as bool?,
      family: json['family'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      parent: json['parent'] as String?,
      values: (json['values'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k,
                (e as List<dynamic>)
                    .map((e) => Value.fromJson(e as Map<String, dynamic>))
                    .toList()),
          ) ??
          const {},
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );
  }

  /// Converts this [Product] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'identifier': identifier,
      'enabled': enabled,
      'family': family,
      'categories': categories,
      'groups': groups,
      'parent': parent,
      'values': values.map<String, dynamic>(
          (key, value) => MapEntry(key, value.map((v) => v.toJson()).toList())),
      'created': created,
      'updated': updated,
    };
  }

  /// Creates a copy of this [Product] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Product copyWith({
    Links? links,
    String? identifier,
    bool? enabled,
    String? family,
    List<String>? categories,
    List<String>? groups,
    String? parent,
    Map<String, List<Value>>? values,
    String? created,
    String? updated,
  }) {
    return Product(
      links: links ?? this.links,
      identifier: identifier ?? this.identifier,
      enabled: enabled ?? this.enabled,
      family: family ?? this.family,
      categories: categories ?? this.categories,
      groups: groups ?? this.groups,
      parent: parent ?? this.parent,
      values: values ?? this.values,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }
}
