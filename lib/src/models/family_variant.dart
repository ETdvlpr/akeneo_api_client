import 'link.dart';

// Represents a family variant in Akeneo
class FamilyVariant {
  final Links? links;
  final String code;
  final Map<String, String?> labels;
  final List<VariantAttributeSet> variantAttributeSets;

  const FamilyVariant({
    this.links,
    required this.code,
    this.labels = const {},
    required this.variantAttributeSets,
  });

  /// Creates an instance of [FamilyVariant] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory FamilyVariant.fromJson(Map<String, dynamic> json) {
    return FamilyVariant(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
      variantAttributeSets: (json['variant_attribute_sets'] as List<dynamic>)
          .map((e) => VariantAttributeSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts this [FamilyVariant] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'code': code,
      'labels': labels,
      'variant_attribute_sets':
          variantAttributeSets.map((set) => set.toJson()).toList(),
    };
  }

  /// Creates a copy of this [FamilyVariant] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  FamilyVariant copyWith({
    Links? links,
    String? code,
    Map<String, String?>? labels,
    List<VariantAttributeSet>? variantAttributeSets,
  }) {
    return FamilyVariant(
      links: links ?? this.links,
      code: code ?? this.code,
      labels: labels ?? this.labels,
      variantAttributeSets: variantAttributeSets ?? this.variantAttributeSets,
    );
  }
}

// Used to define a variant attribute set when creating a family variant
class VariantAttributeSet {
  final int level;
  final List<String> axes;
  final List<String> attributes;

  const VariantAttributeSet({
    required this.level,
    required this.axes,
    this.attributes = const [],
  });

  /// Creates an instance of [VariantAttributeSet] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory VariantAttributeSet.fromJson(Map<String, dynamic> json) {
    return VariantAttributeSet(
      level: json['level'] as int,
      axes: (json['axes'] as List<dynamic>).map((e) => e as String).toList(),
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }

  /// Converts this [VariantAttributeSet] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'axes': axes,
      'attributes': attributes,
    };
  }

  /// Creates a copy of this [VariantAttributeSet] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  VariantAttributeSet copyWith({
    int? level,
    List<String>? axes,
    List<String>? attributes,
  }) {
    return VariantAttributeSet(
      level: level ?? this.level,
      axes: axes ?? this.axes,
      attributes: attributes ?? this.attributes,
    );
  }
}
