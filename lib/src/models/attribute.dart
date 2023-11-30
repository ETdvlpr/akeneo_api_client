import 'link.dart';

/// Represents an attribute in Akeneo.
class Attribute {
  final Links? links;
  final String code;
  final String type;
  final String group;
  final bool unique;
  final bool useableAsGridFilter;
  final List<String> allowedExtensions;
  final String? metricFamily;
  final String? defaultMetricUnit;
  final String? referenceDataName;
  final List<String> availableLocales;
  final int? maxCharacters;
  final String? validationRule;
  final String? validationRegexp;
  final bool? wysiwygEnabled;
  final double? numberMin;
  final double? numberMax;
  final bool? decimalsAllowed;
  final bool? negativeAllowed;
  final String? dateMin;
  final String? dateMax;
  final int? maxFileSize;
  final int? minimumInputLength;
  final int sortOrder;
  final bool localizable;
  final bool scopable;
  final Map<String, String> labels;
  final bool? autoOptionSorting;

  const Attribute({
    this.links,
    required this.code,
    required this.type,
    required this.group,
    this.unique = false,
    this.useableAsGridFilter = false,
    this.allowedExtensions = const [],
    this.metricFamily,
    this.defaultMetricUnit,
    this.referenceDataName,
    this.availableLocales = const [],
    this.maxCharacters,
    this.validationRule,
    this.validationRegexp,
    this.wysiwygEnabled,
    this.numberMin,
    this.numberMax,
    this.decimalsAllowed,
    this.negativeAllowed,
    this.dateMin,
    this.dateMax,
    this.maxFileSize,
    this.minimumInputLength,
    this.sortOrder = 0,
    this.localizable = false,
    this.scopable = false,
    this.labels = const {},
    this.autoOptionSorting,
  });

  /// Creates an instance of [Attribute] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      type: json['type'] as String,
      group: json['group'] as String,
      unique: json['unique'] as bool? ?? false,
      useableAsGridFilter: json['useable_as_grid_filter'] as bool? ?? false,
      allowedExtensions: (json['allowed_extensions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metricFamily: json['metric_family'] as String?,
      defaultMetricUnit: json['default_metric_unit'] as String?,
      referenceDataName: json['reference_data_name'] as String?,
      availableLocales: (json['available_locales'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      maxCharacters: json['max_characters'] as int?,
      validationRule: json['validation_rule'] as String?,
      validationRegexp: json['validation_regexp'] as String?,
      wysiwygEnabled: json['wysiwyg_enabled'] as bool?,
      numberMin: (json['number_min'] as num?)?.toDouble(),
      numberMax: (json['number_max'] as num?)?.toDouble(),
      decimalsAllowed: json['decimals_allowed'] as bool?,
      negativeAllowed: json['negative_allowed'] as bool?,
      dateMin: json['date_min'] as String?,
      dateMax: json['date_max'] as String?,
      maxFileSize: json['max_file_size'] as int?,
      minimumInputLength: json['minimum_input_length'] as int?,
      sortOrder: json['sort_order'] as int? ?? 0,
      localizable: json['localizable'] as bool? ?? false,
      scopable: json['scopable'] as bool? ?? false,
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      autoOptionSorting: json['auto_option_sorting'] as bool?,
    );
  }

  /// Converts this [Attribute] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links?.toJson(),
      'code': code,
      'type': type,
      'group': group,
      'unique': unique,
      'useable_as_grid_filter': useableAsGridFilter,
      'allowed_extensions': allowedExtensions,
      'metric_family': metricFamily,
      'default_metric_unit': defaultMetricUnit,
      'reference_data_name': referenceDataName,
      'available_locales': availableLocales,
      'max_characters': maxCharacters,
      'validation_rule': validationRule,
      'validation_regexp': validationRegexp,
      'wysiwyg_enabled': wysiwygEnabled,
      'number_min': numberMin,
      'number_max': numberMax,
      'decimals_allowed': decimalsAllowed,
      'negative_allowed': negativeAllowed,
      'date_min': dateMin,
      'date_max': dateMax,
      'max_file_size': maxFileSize,
      'minimum_input_length': minimumInputLength,
      'sort_order': sortOrder,
      'localizable': localizable,
      'scopable': scopable,
      'labels': labels,
      'auto_option_sorting': autoOptionSorting,
    };
  }

  /// Creates a copy of this [Attribute] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Attribute copyWith({
    Links? links,
    String? code,
    String? type,
    String? group,
    bool? unique,
    bool? useableAsGridFilter,
    List<String>? allowedExtensions,
    String? metricFamily,
    String? defaultMetricUnit,
    String? referenceDataName,
    List<String>? availableLocales,
    int? maxCharacters,
    String? validationRule,
    String? validationRegexp,
    bool? wysiwygEnabled,
    double? numberMin,
    double? numberMax,
    bool? decimalsAllowed,
    bool? negativeAllowed,
    String? dateMin,
    String? dateMax,
    int? maxFileSize,
    int? minimumInputLength,
    int? sortOrder,
    bool? localizable,
    bool? scopable,
    Map<String, String>? labels,
    bool? autoOptionSorting,
  }) {
    return Attribute(
      links: links ?? this.links,
      code: code ?? this.code,
      type: type ?? this.type,
      group: group ?? this.group,
      unique: unique ?? this.unique,
      useableAsGridFilter: useableAsGridFilter ?? this.useableAsGridFilter,
      allowedExtensions: allowedExtensions ?? this.allowedExtensions,
      metricFamily: metricFamily ?? this.metricFamily,
      defaultMetricUnit: defaultMetricUnit ?? this.defaultMetricUnit,
      referenceDataName: referenceDataName ?? this.referenceDataName,
      availableLocales: availableLocales ?? this.availableLocales,
      maxCharacters: maxCharacters ?? this.maxCharacters,
      validationRule: validationRule ?? this.validationRule,
      validationRegexp: validationRegexp ?? this.validationRegexp,
      wysiwygEnabled: wysiwygEnabled ?? this.wysiwygEnabled,
      numberMin: numberMin ?? this.numberMin,
      numberMax: numberMax ?? this.numberMax,
      decimalsAllowed: decimalsAllowed ?? this.decimalsAllowed,
      negativeAllowed: negativeAllowed ?? this.negativeAllowed,
      dateMin: dateMin ?? this.dateMin,
      dateMax: dateMax ?? this.dateMax,
      maxFileSize: maxFileSize ?? this.maxFileSize,
      minimumInputLength: minimumInputLength ?? this.minimumInputLength,
      sortOrder: sortOrder ?? this.sortOrder,
      localizable: localizable ?? this.localizable,
      scopable: scopable ?? this.scopable,
      labels: labels ?? this.labels,
      autoOptionSorting: autoOptionSorting ?? this.autoOptionSorting,
    );
  }
}
