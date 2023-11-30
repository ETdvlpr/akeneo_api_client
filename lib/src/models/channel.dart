import 'link.dart';

// Represents a channel in Akeneo
class Channel {
  final Links? links;
  final String code;
  final List<String> currencies;
  final List<String> locales;
  final String categoryTree;
  final Map<String, dynamic> conversionUnits;
  final Map<String, String?> labels;

  const Channel({
    this.links,
    required this.code,
    this.currencies = const [],
    this.locales = const [],
    required this.categoryTree,
    this.conversionUnits = const {},
    this.labels = const {},
  });

  /// Creates an instance of [Channel] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      currencies: (json['currencies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      locales: (json['locales'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      categoryTree: json['category_tree'] as String,
      conversionUnits:
          json['conversion_units'] as Map<String, dynamic>? ?? const {},
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );
  }

  /// Converts this [Channel] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'code': code,
      'currencies': currencies,
      'locales': locales,
      'category_tree': categoryTree,
      'conversion_units': conversionUnits,
      'labels': labels,
    };
  }

  /// Creates a copy of this [Channel] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Channel copyWith({
    Links? links,
    String? code,
    List<String>? currencies,
    List<String>? locales,
    String? categoryTree,
    Map<String, dynamic>? conversionUnits,
    Map<String, String?>? labels,
  }) {
    return Channel(
      links: links ?? this.links,
      code: code ?? this.code,
      currencies: currencies ?? this.currencies,
      locales: locales ?? this.locales,
      categoryTree: categoryTree ?? this.categoryTree,
      conversionUnits: conversionUnits ?? this.conversionUnits,
      labels: labels ?? this.labels,
    );
  }
}
