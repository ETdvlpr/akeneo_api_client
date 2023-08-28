// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return _Attribute.fromJson(json);
}

/// @nodoc
mixin _$Attribute {
  String get code => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;
  bool get unique => throw _privateConstructorUsedError;
  @JsonKey(name: 'useable_as_grid_filter')
  bool get useableAsGridFilter => throw _privateConstructorUsedError;
  @JsonKey(name: 'allowed_extensions')
  List<String> get allowedExtensions => throw _privateConstructorUsedError;
  @JsonKey(name: 'metric_family')
  String? get metricFamily => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_metric_unit')
  String? get defaultMetricUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_data_name')
  String? get referenceDataName => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_locales')
  List<String> get availableLocales => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_characters')
  int? get maxCharacters => throw _privateConstructorUsedError;
  @JsonKey(name: 'validation_rule')
  String? get validationRule => throw _privateConstructorUsedError;
  @JsonKey(name: 'validation_regexp')
  String? get validationRegexp => throw _privateConstructorUsedError;
  @JsonKey(name: 'wysiwyg_enabled')
  bool? get wysiwygEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_min')
  double? get numberMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_max')
  double? get numberMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'decimals_allowed')
  bool? get decimalsAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'negative_allowed')
  bool? get negativeAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_min')
  String? get dateMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_max')
  String? get dateMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_file_size')
  int? get maxFileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum_input_length')
  int? get minimumInputLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  bool get localizable => throw _privateConstructorUsedError;
  bool get scopable => throw _privateConstructorUsedError;
  Map<String, String> get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_option_sorting')
  bool? get autoOptionSorting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributeCopyWith<Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeCopyWith<$Res> {
  factory $AttributeCopyWith(Attribute value, $Res Function(Attribute) then) =
      _$AttributeCopyWithImpl<$Res, Attribute>;
  @useResult
  $Res call(
      {String code,
      String type,
      String group,
      bool unique,
      @JsonKey(name: 'useable_as_grid_filter') bool useableAsGridFilter,
      @JsonKey(name: 'allowed_extensions') List<String> allowedExtensions,
      @JsonKey(name: 'metric_family') String? metricFamily,
      @JsonKey(name: 'default_metric_unit') String? defaultMetricUnit,
      @JsonKey(name: 'reference_data_name') String? referenceDataName,
      @JsonKey(name: 'available_locales') List<String> availableLocales,
      @JsonKey(name: 'max_characters') int? maxCharacters,
      @JsonKey(name: 'validation_rule') String? validationRule,
      @JsonKey(name: 'validation_regexp') String? validationRegexp,
      @JsonKey(name: 'wysiwyg_enabled') bool? wysiwygEnabled,
      @JsonKey(name: 'number_min') double? numberMin,
      @JsonKey(name: 'number_max') double? numberMax,
      @JsonKey(name: 'decimals_allowed') bool? decimalsAllowed,
      @JsonKey(name: 'negative_allowed') bool? negativeAllowed,
      @JsonKey(name: 'date_min') String? dateMin,
      @JsonKey(name: 'date_max') String? dateMax,
      @JsonKey(name: 'max_file_size') int? maxFileSize,
      @JsonKey(name: 'minimum_input_length') int? minimumInputLength,
      @JsonKey(name: 'sort_order') int sortOrder,
      bool localizable,
      bool scopable,
      Map<String, String> labels,
      @JsonKey(name: 'auto_option_sorting') bool? autoOptionSorting});
}

/// @nodoc
class _$AttributeCopyWithImpl<$Res, $Val extends Attribute>
    implements $AttributeCopyWith<$Res> {
  _$AttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? type = null,
    Object? group = null,
    Object? unique = null,
    Object? useableAsGridFilter = null,
    Object? allowedExtensions = null,
    Object? metricFamily = freezed,
    Object? defaultMetricUnit = freezed,
    Object? referenceDataName = freezed,
    Object? availableLocales = null,
    Object? maxCharacters = freezed,
    Object? validationRule = freezed,
    Object? validationRegexp = freezed,
    Object? wysiwygEnabled = freezed,
    Object? numberMin = freezed,
    Object? numberMax = freezed,
    Object? decimalsAllowed = freezed,
    Object? negativeAllowed = freezed,
    Object? dateMin = freezed,
    Object? dateMax = freezed,
    Object? maxFileSize = freezed,
    Object? minimumInputLength = freezed,
    Object? sortOrder = null,
    Object? localizable = null,
    Object? scopable = null,
    Object? labels = null,
    Object? autoOptionSorting = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as bool,
      useableAsGridFilter: null == useableAsGridFilter
          ? _value.useableAsGridFilter
          : useableAsGridFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      allowedExtensions: null == allowedExtensions
          ? _value.allowedExtensions
          : allowedExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metricFamily: freezed == metricFamily
          ? _value.metricFamily
          : metricFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultMetricUnit: freezed == defaultMetricUnit
          ? _value.defaultMetricUnit
          : defaultMetricUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceDataName: freezed == referenceDataName
          ? _value.referenceDataName
          : referenceDataName // ignore: cast_nullable_to_non_nullable
              as String?,
      availableLocales: null == availableLocales
          ? _value.availableLocales
          : availableLocales // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxCharacters: freezed == maxCharacters
          ? _value.maxCharacters
          : maxCharacters // ignore: cast_nullable_to_non_nullable
              as int?,
      validationRule: freezed == validationRule
          ? _value.validationRule
          : validationRule // ignore: cast_nullable_to_non_nullable
              as String?,
      validationRegexp: freezed == validationRegexp
          ? _value.validationRegexp
          : validationRegexp // ignore: cast_nullable_to_non_nullable
              as String?,
      wysiwygEnabled: freezed == wysiwygEnabled
          ? _value.wysiwygEnabled
          : wysiwygEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      numberMin: freezed == numberMin
          ? _value.numberMin
          : numberMin // ignore: cast_nullable_to_non_nullable
              as double?,
      numberMax: freezed == numberMax
          ? _value.numberMax
          : numberMax // ignore: cast_nullable_to_non_nullable
              as double?,
      decimalsAllowed: freezed == decimalsAllowed
          ? _value.decimalsAllowed
          : decimalsAllowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      negativeAllowed: freezed == negativeAllowed
          ? _value.negativeAllowed
          : negativeAllowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateMin: freezed == dateMin
          ? _value.dateMin
          : dateMin // ignore: cast_nullable_to_non_nullable
              as String?,
      dateMax: freezed == dateMax
          ? _value.dateMax
          : dateMax // ignore: cast_nullable_to_non_nullable
              as String?,
      maxFileSize: freezed == maxFileSize
          ? _value.maxFileSize
          : maxFileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      minimumInputLength: freezed == minimumInputLength
          ? _value.minimumInputLength
          : minimumInputLength // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      localizable: null == localizable
          ? _value.localizable
          : localizable // ignore: cast_nullable_to_non_nullable
              as bool,
      scopable: null == scopable
          ? _value.scopable
          : scopable // ignore: cast_nullable_to_non_nullable
              as bool,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      autoOptionSorting: freezed == autoOptionSorting
          ? _value.autoOptionSorting
          : autoOptionSorting // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$$_AttributeCopyWith(
          _$_Attribute value, $Res Function(_$_Attribute) then) =
      __$$_AttributeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String type,
      String group,
      bool unique,
      @JsonKey(name: 'useable_as_grid_filter') bool useableAsGridFilter,
      @JsonKey(name: 'allowed_extensions') List<String> allowedExtensions,
      @JsonKey(name: 'metric_family') String? metricFamily,
      @JsonKey(name: 'default_metric_unit') String? defaultMetricUnit,
      @JsonKey(name: 'reference_data_name') String? referenceDataName,
      @JsonKey(name: 'available_locales') List<String> availableLocales,
      @JsonKey(name: 'max_characters') int? maxCharacters,
      @JsonKey(name: 'validation_rule') String? validationRule,
      @JsonKey(name: 'validation_regexp') String? validationRegexp,
      @JsonKey(name: 'wysiwyg_enabled') bool? wysiwygEnabled,
      @JsonKey(name: 'number_min') double? numberMin,
      @JsonKey(name: 'number_max') double? numberMax,
      @JsonKey(name: 'decimals_allowed') bool? decimalsAllowed,
      @JsonKey(name: 'negative_allowed') bool? negativeAllowed,
      @JsonKey(name: 'date_min') String? dateMin,
      @JsonKey(name: 'date_max') String? dateMax,
      @JsonKey(name: 'max_file_size') int? maxFileSize,
      @JsonKey(name: 'minimum_input_length') int? minimumInputLength,
      @JsonKey(name: 'sort_order') int sortOrder,
      bool localizable,
      bool scopable,
      Map<String, String> labels,
      @JsonKey(name: 'auto_option_sorting') bool? autoOptionSorting});
}

/// @nodoc
class __$$_AttributeCopyWithImpl<$Res>
    extends _$AttributeCopyWithImpl<$Res, _$_Attribute>
    implements _$$_AttributeCopyWith<$Res> {
  __$$_AttributeCopyWithImpl(
      _$_Attribute _value, $Res Function(_$_Attribute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? type = null,
    Object? group = null,
    Object? unique = null,
    Object? useableAsGridFilter = null,
    Object? allowedExtensions = null,
    Object? metricFamily = freezed,
    Object? defaultMetricUnit = freezed,
    Object? referenceDataName = freezed,
    Object? availableLocales = null,
    Object? maxCharacters = freezed,
    Object? validationRule = freezed,
    Object? validationRegexp = freezed,
    Object? wysiwygEnabled = freezed,
    Object? numberMin = freezed,
    Object? numberMax = freezed,
    Object? decimalsAllowed = freezed,
    Object? negativeAllowed = freezed,
    Object? dateMin = freezed,
    Object? dateMax = freezed,
    Object? maxFileSize = freezed,
    Object? minimumInputLength = freezed,
    Object? sortOrder = null,
    Object? localizable = null,
    Object? scopable = null,
    Object? labels = null,
    Object? autoOptionSorting = freezed,
  }) {
    return _then(_$_Attribute(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as bool,
      useableAsGridFilter: null == useableAsGridFilter
          ? _value.useableAsGridFilter
          : useableAsGridFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      allowedExtensions: null == allowedExtensions
          ? _value._allowedExtensions
          : allowedExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metricFamily: freezed == metricFamily
          ? _value.metricFamily
          : metricFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultMetricUnit: freezed == defaultMetricUnit
          ? _value.defaultMetricUnit
          : defaultMetricUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceDataName: freezed == referenceDataName
          ? _value.referenceDataName
          : referenceDataName // ignore: cast_nullable_to_non_nullable
              as String?,
      availableLocales: null == availableLocales
          ? _value._availableLocales
          : availableLocales // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxCharacters: freezed == maxCharacters
          ? _value.maxCharacters
          : maxCharacters // ignore: cast_nullable_to_non_nullable
              as int?,
      validationRule: freezed == validationRule
          ? _value.validationRule
          : validationRule // ignore: cast_nullable_to_non_nullable
              as String?,
      validationRegexp: freezed == validationRegexp
          ? _value.validationRegexp
          : validationRegexp // ignore: cast_nullable_to_non_nullable
              as String?,
      wysiwygEnabled: freezed == wysiwygEnabled
          ? _value.wysiwygEnabled
          : wysiwygEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      numberMin: freezed == numberMin
          ? _value.numberMin
          : numberMin // ignore: cast_nullable_to_non_nullable
              as double?,
      numberMax: freezed == numberMax
          ? _value.numberMax
          : numberMax // ignore: cast_nullable_to_non_nullable
              as double?,
      decimalsAllowed: freezed == decimalsAllowed
          ? _value.decimalsAllowed
          : decimalsAllowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      negativeAllowed: freezed == negativeAllowed
          ? _value.negativeAllowed
          : negativeAllowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateMin: freezed == dateMin
          ? _value.dateMin
          : dateMin // ignore: cast_nullable_to_non_nullable
              as String?,
      dateMax: freezed == dateMax
          ? _value.dateMax
          : dateMax // ignore: cast_nullable_to_non_nullable
              as String?,
      maxFileSize: freezed == maxFileSize
          ? _value.maxFileSize
          : maxFileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      minimumInputLength: freezed == minimumInputLength
          ? _value.minimumInputLength
          : minimumInputLength // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      localizable: null == localizable
          ? _value.localizable
          : localizable // ignore: cast_nullable_to_non_nullable
              as bool,
      scopable: null == scopable
          ? _value.scopable
          : scopable // ignore: cast_nullable_to_non_nullable
              as bool,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      autoOptionSorting: freezed == autoOptionSorting
          ? _value.autoOptionSorting
          : autoOptionSorting // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Attribute implements _Attribute {
  const _$_Attribute(
      {required this.code,
      required this.type,
      required this.group,
      this.unique = false,
      @JsonKey(name: 'useable_as_grid_filter') this.useableAsGridFilter = false,
      @JsonKey(name: 'allowed_extensions')
      final List<String> allowedExtensions = const [],
      @JsonKey(name: 'metric_family') this.metricFamily,
      @JsonKey(name: 'default_metric_unit') this.defaultMetricUnit,
      @JsonKey(name: 'reference_data_name') this.referenceDataName,
      @JsonKey(name: 'available_locales')
      final List<String> availableLocales = const [],
      @JsonKey(name: 'max_characters') this.maxCharacters,
      @JsonKey(name: 'validation_rule') this.validationRule,
      @JsonKey(name: 'validation_regexp') this.validationRegexp,
      @JsonKey(name: 'wysiwyg_enabled') this.wysiwygEnabled,
      @JsonKey(name: 'number_min') this.numberMin,
      @JsonKey(name: 'number_max') this.numberMax,
      @JsonKey(name: 'decimals_allowed') this.decimalsAllowed,
      @JsonKey(name: 'negative_allowed') this.negativeAllowed,
      @JsonKey(name: 'date_min') this.dateMin,
      @JsonKey(name: 'date_max') this.dateMax,
      @JsonKey(name: 'max_file_size') this.maxFileSize,
      @JsonKey(name: 'minimum_input_length') this.minimumInputLength,
      @JsonKey(name: 'sort_order') this.sortOrder = 0,
      this.localizable = false,
      this.scopable = false,
      final Map<String, String> labels = const {},
      @JsonKey(name: 'auto_option_sorting') this.autoOptionSorting})
      : _allowedExtensions = allowedExtensions,
        _availableLocales = availableLocales,
        _labels = labels;

  factory _$_Attribute.fromJson(Map<String, dynamic> json) =>
      _$$_AttributeFromJson(json);

  @override
  final String code;
  @override
  final String type;
  @override
  final String group;
  @override
  @JsonKey()
  final bool unique;
  @override
  @JsonKey(name: 'useable_as_grid_filter')
  final bool useableAsGridFilter;
  final List<String> _allowedExtensions;
  @override
  @JsonKey(name: 'allowed_extensions')
  List<String> get allowedExtensions {
    if (_allowedExtensions is EqualUnmodifiableListView)
      return _allowedExtensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedExtensions);
  }

  @override
  @JsonKey(name: 'metric_family')
  final String? metricFamily;
  @override
  @JsonKey(name: 'default_metric_unit')
  final String? defaultMetricUnit;
  @override
  @JsonKey(name: 'reference_data_name')
  final String? referenceDataName;
  final List<String> _availableLocales;
  @override
  @JsonKey(name: 'available_locales')
  List<String> get availableLocales {
    if (_availableLocales is EqualUnmodifiableListView)
      return _availableLocales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableLocales);
  }

  @override
  @JsonKey(name: 'max_characters')
  final int? maxCharacters;
  @override
  @JsonKey(name: 'validation_rule')
  final String? validationRule;
  @override
  @JsonKey(name: 'validation_regexp')
  final String? validationRegexp;
  @override
  @JsonKey(name: 'wysiwyg_enabled')
  final bool? wysiwygEnabled;
  @override
  @JsonKey(name: 'number_min')
  final double? numberMin;
  @override
  @JsonKey(name: 'number_max')
  final double? numberMax;
  @override
  @JsonKey(name: 'decimals_allowed')
  final bool? decimalsAllowed;
  @override
  @JsonKey(name: 'negative_allowed')
  final bool? negativeAllowed;
  @override
  @JsonKey(name: 'date_min')
  final String? dateMin;
  @override
  @JsonKey(name: 'date_max')
  final String? dateMax;
  @override
  @JsonKey(name: 'max_file_size')
  final int? maxFileSize;
  @override
  @JsonKey(name: 'minimum_input_length')
  final int? minimumInputLength;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey()
  final bool localizable;
  @override
  @JsonKey()
  final bool scopable;
  final Map<String, String> _labels;
  @override
  @JsonKey()
  Map<String, String> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  @override
  @JsonKey(name: 'auto_option_sorting')
  final bool? autoOptionSorting;

  @override
  String toString() {
    return 'Attribute(code: $code, type: $type, group: $group, unique: $unique, useableAsGridFilter: $useableAsGridFilter, allowedExtensions: $allowedExtensions, metricFamily: $metricFamily, defaultMetricUnit: $defaultMetricUnit, referenceDataName: $referenceDataName, availableLocales: $availableLocales, maxCharacters: $maxCharacters, validationRule: $validationRule, validationRegexp: $validationRegexp, wysiwygEnabled: $wysiwygEnabled, numberMin: $numberMin, numberMax: $numberMax, decimalsAllowed: $decimalsAllowed, negativeAllowed: $negativeAllowed, dateMin: $dateMin, dateMax: $dateMax, maxFileSize: $maxFileSize, minimumInputLength: $minimumInputLength, sortOrder: $sortOrder, localizable: $localizable, scopable: $scopable, labels: $labels, autoOptionSorting: $autoOptionSorting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Attribute &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.useableAsGridFilter, useableAsGridFilter) ||
                other.useableAsGridFilter == useableAsGridFilter) &&
            const DeepCollectionEquality()
                .equals(other._allowedExtensions, _allowedExtensions) &&
            (identical(other.metricFamily, metricFamily) ||
                other.metricFamily == metricFamily) &&
            (identical(other.defaultMetricUnit, defaultMetricUnit) ||
                other.defaultMetricUnit == defaultMetricUnit) &&
            (identical(other.referenceDataName, referenceDataName) ||
                other.referenceDataName == referenceDataName) &&
            const DeepCollectionEquality()
                .equals(other._availableLocales, _availableLocales) &&
            (identical(other.maxCharacters, maxCharacters) ||
                other.maxCharacters == maxCharacters) &&
            (identical(other.validationRule, validationRule) ||
                other.validationRule == validationRule) &&
            (identical(other.validationRegexp, validationRegexp) ||
                other.validationRegexp == validationRegexp) &&
            (identical(other.wysiwygEnabled, wysiwygEnabled) ||
                other.wysiwygEnabled == wysiwygEnabled) &&
            (identical(other.numberMin, numberMin) ||
                other.numberMin == numberMin) &&
            (identical(other.numberMax, numberMax) ||
                other.numberMax == numberMax) &&
            (identical(other.decimalsAllowed, decimalsAllowed) ||
                other.decimalsAllowed == decimalsAllowed) &&
            (identical(other.negativeAllowed, negativeAllowed) ||
                other.negativeAllowed == negativeAllowed) &&
            (identical(other.dateMin, dateMin) || other.dateMin == dateMin) &&
            (identical(other.dateMax, dateMax) || other.dateMax == dateMax) &&
            (identical(other.maxFileSize, maxFileSize) ||
                other.maxFileSize == maxFileSize) &&
            (identical(other.minimumInputLength, minimumInputLength) ||
                other.minimumInputLength == minimumInputLength) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.localizable, localizable) ||
                other.localizable == localizable) &&
            (identical(other.scopable, scopable) ||
                other.scopable == scopable) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.autoOptionSorting, autoOptionSorting) ||
                other.autoOptionSorting == autoOptionSorting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        code,
        type,
        group,
        unique,
        useableAsGridFilter,
        const DeepCollectionEquality().hash(_allowedExtensions),
        metricFamily,
        defaultMetricUnit,
        referenceDataName,
        const DeepCollectionEquality().hash(_availableLocales),
        maxCharacters,
        validationRule,
        validationRegexp,
        wysiwygEnabled,
        numberMin,
        numberMax,
        decimalsAllowed,
        negativeAllowed,
        dateMin,
        dateMax,
        maxFileSize,
        minimumInputLength,
        sortOrder,
        localizable,
        scopable,
        const DeepCollectionEquality().hash(_labels),
        autoOptionSorting
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttributeCopyWith<_$_Attribute> get copyWith =>
      __$$_AttributeCopyWithImpl<_$_Attribute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttributeToJson(
      this,
    );
  }
}

abstract class _Attribute implements Attribute {
  const factory _Attribute(
      {required final String code,
      required final String type,
      required final String group,
      final bool unique,
      @JsonKey(name: 'useable_as_grid_filter') final bool useableAsGridFilter,
      @JsonKey(name: 'allowed_extensions') final List<String> allowedExtensions,
      @JsonKey(name: 'metric_family') final String? metricFamily,
      @JsonKey(name: 'default_metric_unit') final String? defaultMetricUnit,
      @JsonKey(name: 'reference_data_name') final String? referenceDataName,
      @JsonKey(name: 'available_locales') final List<String> availableLocales,
      @JsonKey(name: 'max_characters') final int? maxCharacters,
      @JsonKey(name: 'validation_rule') final String? validationRule,
      @JsonKey(name: 'validation_regexp') final String? validationRegexp,
      @JsonKey(name: 'wysiwyg_enabled') final bool? wysiwygEnabled,
      @JsonKey(name: 'number_min') final double? numberMin,
      @JsonKey(name: 'number_max') final double? numberMax,
      @JsonKey(name: 'decimals_allowed') final bool? decimalsAllowed,
      @JsonKey(name: 'negative_allowed') final bool? negativeAllowed,
      @JsonKey(name: 'date_min') final String? dateMin,
      @JsonKey(name: 'date_max') final String? dateMax,
      @JsonKey(name: 'max_file_size') final int? maxFileSize,
      @JsonKey(name: 'minimum_input_length') final int? minimumInputLength,
      @JsonKey(name: 'sort_order') final int sortOrder,
      final bool localizable,
      final bool scopable,
      final Map<String, String> labels,
      @JsonKey(name: 'auto_option_sorting')
      final bool? autoOptionSorting}) = _$_Attribute;

  factory _Attribute.fromJson(Map<String, dynamic> json) =
      _$_Attribute.fromJson;

  @override
  String get code;
  @override
  String get type;
  @override
  String get group;
  @override
  bool get unique;
  @override
  @JsonKey(name: 'useable_as_grid_filter')
  bool get useableAsGridFilter;
  @override
  @JsonKey(name: 'allowed_extensions')
  List<String> get allowedExtensions;
  @override
  @JsonKey(name: 'metric_family')
  String? get metricFamily;
  @override
  @JsonKey(name: 'default_metric_unit')
  String? get defaultMetricUnit;
  @override
  @JsonKey(name: 'reference_data_name')
  String? get referenceDataName;
  @override
  @JsonKey(name: 'available_locales')
  List<String> get availableLocales;
  @override
  @JsonKey(name: 'max_characters')
  int? get maxCharacters;
  @override
  @JsonKey(name: 'validation_rule')
  String? get validationRule;
  @override
  @JsonKey(name: 'validation_regexp')
  String? get validationRegexp;
  @override
  @JsonKey(name: 'wysiwyg_enabled')
  bool? get wysiwygEnabled;
  @override
  @JsonKey(name: 'number_min')
  double? get numberMin;
  @override
  @JsonKey(name: 'number_max')
  double? get numberMax;
  @override
  @JsonKey(name: 'decimals_allowed')
  bool? get decimalsAllowed;
  @override
  @JsonKey(name: 'negative_allowed')
  bool? get negativeAllowed;
  @override
  @JsonKey(name: 'date_min')
  String? get dateMin;
  @override
  @JsonKey(name: 'date_max')
  String? get dateMax;
  @override
  @JsonKey(name: 'max_file_size')
  int? get maxFileSize;
  @override
  @JsonKey(name: 'minimum_input_length')
  int? get minimumInputLength;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  bool get localizable;
  @override
  bool get scopable;
  @override
  Map<String, String> get labels;
  @override
  @JsonKey(name: 'auto_option_sorting')
  bool? get autoOptionSorting;
  @override
  @JsonKey(ignore: true)
  _$$_AttributeCopyWith<_$_Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}

AttributeGroup _$AttributeGroupFromJson(Map<String, dynamic> json) {
  return _AttributeGroup.fromJson(json);
}

/// @nodoc
mixin _$AttributeGroup {
  Links? get links => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int? get sortOrder => throw _privateConstructorUsedError;
  List<String>? get attributes => throw _privateConstructorUsedError;
  Map<String, String?> get labels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributeGroupCopyWith<AttributeGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeGroupCopyWith<$Res> {
  factory $AttributeGroupCopyWith(
          AttributeGroup value, $Res Function(AttributeGroup) then) =
      _$AttributeGroupCopyWithImpl<$Res, AttributeGroup>;
  @useResult
  $Res call(
      {Links? links,
      String code,
      @JsonKey(name: 'sort_order') int? sortOrder,
      List<String>? attributes,
      Map<String, String?> labels});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$AttributeGroupCopyWithImpl<$Res, $Val extends AttributeGroup>
    implements $AttributeGroupCopyWith<$Res> {
  _$AttributeGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? sortOrder = freezed,
    Object? attributes = freezed,
    Object? labels = null,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttributeGroupCopyWith<$Res>
    implements $AttributeGroupCopyWith<$Res> {
  factory _$$_AttributeGroupCopyWith(
          _$_AttributeGroup value, $Res Function(_$_AttributeGroup) then) =
      __$$_AttributeGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Links? links,
      String code,
      @JsonKey(name: 'sort_order') int? sortOrder,
      List<String>? attributes,
      Map<String, String?> labels});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_AttributeGroupCopyWithImpl<$Res>
    extends _$AttributeGroupCopyWithImpl<$Res, _$_AttributeGroup>
    implements _$$_AttributeGroupCopyWith<$Res> {
  __$$_AttributeGroupCopyWithImpl(
      _$_AttributeGroup _value, $Res Function(_$_AttributeGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? sortOrder = freezed,
    Object? attributes = freezed,
    Object? labels = null,
  }) {
    return _then(_$_AttributeGroup(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttributeGroup implements _AttributeGroup {
  const _$_AttributeGroup(
      {this.links,
      required this.code,
      @JsonKey(name: 'sort_order') this.sortOrder,
      final List<String>? attributes,
      final Map<String, String?> labels = const {}})
      : _attributes = attributes,
        _labels = labels;

  factory _$_AttributeGroup.fromJson(Map<String, dynamic> json) =>
      _$$_AttributeGroupFromJson(json);

  @override
  final Links? links;
  @override
  final String code;
  @override
  @JsonKey(name: 'sort_order')
  final int? sortOrder;
  final List<String>? _attributes;
  @override
  List<String>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, String?> _labels;
  @override
  @JsonKey()
  Map<String, String?> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  @override
  String toString() {
    return 'AttributeGroup(links: $links, code: $code, sortOrder: $sortOrder, attributes: $attributes, labels: $labels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttributeGroup &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      links,
      code,
      sortOrder,
      const DeepCollectionEquality().hash(_attributes),
      const DeepCollectionEquality().hash(_labels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttributeGroupCopyWith<_$_AttributeGroup> get copyWith =>
      __$$_AttributeGroupCopyWithImpl<_$_AttributeGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttributeGroupToJson(
      this,
    );
  }
}

abstract class _AttributeGroup implements AttributeGroup {
  const factory _AttributeGroup(
      {final Links? links,
      required final String code,
      @JsonKey(name: 'sort_order') final int? sortOrder,
      final List<String>? attributes,
      final Map<String, String?> labels}) = _$_AttributeGroup;

  factory _AttributeGroup.fromJson(Map<String, dynamic> json) =
      _$_AttributeGroup.fromJson;

  @override
  Links? get links;
  @override
  String get code;
  @override
  @JsonKey(name: 'sort_order')
  int? get sortOrder;
  @override
  List<String>? get attributes;
  @override
  Map<String, String?> get labels;
  @override
  @JsonKey(ignore: true)
  _$$_AttributeGroupCopyWith<_$_AttributeGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

AttributeOption _$AttributeOptionFromJson(Map<String, dynamic> json) {
  return _AttributeOption.fromJson(json);
}

/// @nodoc
mixin _$AttributeOption {
  Links? get links => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get attribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  Map<String, String?> get labels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributeOptionCopyWith<AttributeOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeOptionCopyWith<$Res> {
  factory $AttributeOptionCopyWith(
          AttributeOption value, $Res Function(AttributeOption) then) =
      _$AttributeOptionCopyWithImpl<$Res, AttributeOption>;
  @useResult
  $Res call(
      {Links? links,
      String code,
      String attribute,
      @JsonKey(name: 'sort_order') int sortOrder,
      Map<String, String?> labels});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$AttributeOptionCopyWithImpl<$Res, $Val extends AttributeOption>
    implements $AttributeOptionCopyWith<$Res> {
  _$AttributeOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? attribute = null,
    Object? sortOrder = null,
    Object? labels = null,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttributeOptionCopyWith<$Res>
    implements $AttributeOptionCopyWith<$Res> {
  factory _$$_AttributeOptionCopyWith(
          _$_AttributeOption value, $Res Function(_$_AttributeOption) then) =
      __$$_AttributeOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Links? links,
      String code,
      String attribute,
      @JsonKey(name: 'sort_order') int sortOrder,
      Map<String, String?> labels});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_AttributeOptionCopyWithImpl<$Res>
    extends _$AttributeOptionCopyWithImpl<$Res, _$_AttributeOption>
    implements _$$_AttributeOptionCopyWith<$Res> {
  __$$_AttributeOptionCopyWithImpl(
      _$_AttributeOption _value, $Res Function(_$_AttributeOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? attribute = null,
    Object? sortOrder = null,
    Object? labels = null,
  }) {
    return _then(_$_AttributeOption(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttributeOption implements _AttributeOption {
  const _$_AttributeOption(
      {this.links,
      required this.code,
      required this.attribute,
      @JsonKey(name: 'sort_order') this.sortOrder = 0,
      final Map<String, String?> labels = const {}})
      : _labels = labels;

  factory _$_AttributeOption.fromJson(Map<String, dynamic> json) =>
      _$$_AttributeOptionFromJson(json);

  @override
  final Links? links;
  @override
  final String code;
  @override
  final String attribute;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  final Map<String, String?> _labels;
  @override
  @JsonKey()
  Map<String, String?> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  @override
  String toString() {
    return 'AttributeOption(links: $links, code: $code, attribute: $attribute, sortOrder: $sortOrder, labels: $labels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttributeOption &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, links, code, attribute,
      sortOrder, const DeepCollectionEquality().hash(_labels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttributeOptionCopyWith<_$_AttributeOption> get copyWith =>
      __$$_AttributeOptionCopyWithImpl<_$_AttributeOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttributeOptionToJson(
      this,
    );
  }
}

abstract class _AttributeOption implements AttributeOption {
  const factory _AttributeOption(
      {final Links? links,
      required final String code,
      required final String attribute,
      @JsonKey(name: 'sort_order') final int sortOrder,
      final Map<String, String?> labels}) = _$_AttributeOption;

  factory _AttributeOption.fromJson(Map<String, dynamic> json) =
      _$_AttributeOption.fromJson;

  @override
  Links? get links;
  @override
  String get code;
  @override
  String get attribute;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  Map<String, String?> get labels;
  @override
  @JsonKey(ignore: true)
  _$$_AttributeOptionCopyWith<_$_AttributeOption> get copyWith =>
      throw _privateConstructorUsedError;
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
mixin _$Channel {
  Links? get links => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  List<String> get currencies => throw _privateConstructorUsedError;
  List<String> get locales => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_tree')
  String get categoryTree => throw _privateConstructorUsedError;
  Map<String, dynamic> get conversionUnits =>
      throw _privateConstructorUsedError;
  Map<String, String?> get labels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res, Channel>;
  @useResult
  $Res call(
      {Links? links,
      String code,
      List<String> currencies,
      List<String> locales,
      @JsonKey(name: 'category_tree') String categoryTree,
      Map<String, dynamic> conversionUnits,
      Map<String, String?> labels});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res, $Val extends Channel>
    implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? currencies = null,
    Object? locales = null,
    Object? categoryTree = null,
    Object? conversionUnits = null,
    Object? labels = null,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      locales: null == locales
          ? _value.locales
          : locales // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryTree: null == categoryTree
          ? _value.categoryTree
          : categoryTree // ignore: cast_nullable_to_non_nullable
              as String,
      conversionUnits: null == conversionUnits
          ? _value.conversionUnits
          : conversionUnits // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChannelCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$$_ChannelCopyWith(
          _$_Channel value, $Res Function(_$_Channel) then) =
      __$$_ChannelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Links? links,
      String code,
      List<String> currencies,
      List<String> locales,
      @JsonKey(name: 'category_tree') String categoryTree,
      Map<String, dynamic> conversionUnits,
      Map<String, String?> labels});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_ChannelCopyWithImpl<$Res>
    extends _$ChannelCopyWithImpl<$Res, _$_Channel>
    implements _$$_ChannelCopyWith<$Res> {
  __$$_ChannelCopyWithImpl(_$_Channel _value, $Res Function(_$_Channel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? currencies = null,
    Object? locales = null,
    Object? categoryTree = null,
    Object? conversionUnits = null,
    Object? labels = null,
  }) {
    return _then(_$_Channel(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      locales: null == locales
          ? _value._locales
          : locales // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryTree: null == categoryTree
          ? _value.categoryTree
          : categoryTree // ignore: cast_nullable_to_non_nullable
              as String,
      conversionUnits: null == conversionUnits
          ? _value._conversionUnits
          : conversionUnits // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Channel implements _Channel {
  const _$_Channel(
      {this.links,
      required this.code,
      final List<String> currencies = const [],
      final List<String> locales = const [],
      @JsonKey(name: 'category_tree') required this.categoryTree,
      final Map<String, dynamic> conversionUnits = const {},
      final Map<String, String?> labels = const {}})
      : _currencies = currencies,
        _locales = locales,
        _conversionUnits = conversionUnits,
        _labels = labels;

  factory _$_Channel.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelFromJson(json);

  @override
  final Links? links;
  @override
  final String code;
  final List<String> _currencies;
  @override
  @JsonKey()
  List<String> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  final List<String> _locales;
  @override
  @JsonKey()
  List<String> get locales {
    if (_locales is EqualUnmodifiableListView) return _locales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locales);
  }

  @override
  @JsonKey(name: 'category_tree')
  final String categoryTree;
  final Map<String, dynamic> _conversionUnits;
  @override
  @JsonKey()
  Map<String, dynamic> get conversionUnits {
    if (_conversionUnits is EqualUnmodifiableMapView) return _conversionUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_conversionUnits);
  }

  final Map<String, String?> _labels;
  @override
  @JsonKey()
  Map<String, String?> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  @override
  String toString() {
    return 'Channel(links: $links, code: $code, currencies: $currencies, locales: $locales, categoryTree: $categoryTree, conversionUnits: $conversionUnits, labels: $labels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Channel &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            const DeepCollectionEquality().equals(other._locales, _locales) &&
            (identical(other.categoryTree, categoryTree) ||
                other.categoryTree == categoryTree) &&
            const DeepCollectionEquality()
                .equals(other._conversionUnits, _conversionUnits) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      links,
      code,
      const DeepCollectionEquality().hash(_currencies),
      const DeepCollectionEquality().hash(_locales),
      categoryTree,
      const DeepCollectionEquality().hash(_conversionUnits),
      const DeepCollectionEquality().hash(_labels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChannelCopyWith<_$_Channel> get copyWith =>
      __$$_ChannelCopyWithImpl<_$_Channel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelToJson(
      this,
    );
  }
}

abstract class _Channel implements Channel {
  const factory _Channel(
      {final Links? links,
      required final String code,
      final List<String> currencies,
      final List<String> locales,
      @JsonKey(name: 'category_tree') required final String categoryTree,
      final Map<String, dynamic> conversionUnits,
      final Map<String, String?> labels}) = _$_Channel;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$_Channel.fromJson;

  @override
  Links? get links;
  @override
  String get code;
  @override
  List<String> get currencies;
  @override
  List<String> get locales;
  @override
  @JsonKey(name: 'category_tree')
  String get categoryTree;
  @override
  Map<String, dynamic> get conversionUnits;
  @override
  Map<String, String?> get labels;
  @override
  @JsonKey(ignore: true)
  _$$_ChannelCopyWith<_$_Channel> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get code => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  Map<String, String?> get labels => throw _privateConstructorUsedError;
  Links? get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String code, String? parent, Map<String, String?> labels, Links? links});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? parent = freezed,
    Object? labels = null,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String? parent, Map<String, String?> labels, Links? links});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? parent = freezed,
    Object? labels = null,
    Object? links = freezed,
  }) {
    return _then(_$_Category(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category(
      {required this.code,
      this.parent,
      final Map<String, String?> labels = const {},
      this.links})
      : _labels = labels;

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final String code;
  @override
  final String? parent;
  final Map<String, String?> _labels;
  @override
  @JsonKey()
  Map<String, String?> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  @override
  final Links? links;

  @override
  String toString() {
    return 'Category(code: $code, parent: $parent, labels: $labels, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, parent,
      const DeepCollectionEquality().hash(_labels), links);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final String code,
      final String? parent,
      final Map<String, String?> labels,
      final Links? links}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String get code;
  @override
  String? get parent;
  @override
  Map<String, String?> get labels;
  @override
  Links? get links;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}

Family _$FamilyFromJson(Map<String, dynamic> json) {
  return _Family.fromJson(json);
}

/// @nodoc
mixin _$Family {
  Links? get links => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  List<String> get attributes => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribute_as_label')
  String? get attributeAsLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribute_as_image')
  String? get attributeAsImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribute_requirements')
  Map<String, List<String>> get attributeRequirements =>
      throw _privateConstructorUsedError;
  Map<String, String?> get labels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FamilyCopyWith<Family> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyCopyWith<$Res> {
  factory $FamilyCopyWith(Family value, $Res Function(Family) then) =
      _$FamilyCopyWithImpl<$Res, Family>;
  @useResult
  $Res call(
      {Links? links,
      String code,
      List<String> attributes,
      @JsonKey(name: 'attribute_as_label') String? attributeAsLabel,
      @JsonKey(name: 'attribute_as_image') String? attributeAsImage,
      @JsonKey(name: 'attribute_requirements')
      Map<String, List<String>> attributeRequirements,
      Map<String, String?> labels});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$FamilyCopyWithImpl<$Res, $Val extends Family>
    implements $FamilyCopyWith<$Res> {
  _$FamilyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? attributes = null,
    Object? attributeAsLabel = freezed,
    Object? attributeAsImage = freezed,
    Object? attributeRequirements = null,
    Object? labels = null,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attributeAsLabel: freezed == attributeAsLabel
          ? _value.attributeAsLabel
          : attributeAsLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      attributeAsImage: freezed == attributeAsImage
          ? _value.attributeAsImage
          : attributeAsImage // ignore: cast_nullable_to_non_nullable
              as String?,
      attributeRequirements: null == attributeRequirements
          ? _value.attributeRequirements
          : attributeRequirements // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FamilyCopyWith<$Res> implements $FamilyCopyWith<$Res> {
  factory _$$_FamilyCopyWith(_$_Family value, $Res Function(_$_Family) then) =
      __$$_FamilyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Links? links,
      String code,
      List<String> attributes,
      @JsonKey(name: 'attribute_as_label') String? attributeAsLabel,
      @JsonKey(name: 'attribute_as_image') String? attributeAsImage,
      @JsonKey(name: 'attribute_requirements')
      Map<String, List<String>> attributeRequirements,
      Map<String, String?> labels});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_FamilyCopyWithImpl<$Res>
    extends _$FamilyCopyWithImpl<$Res, _$_Family>
    implements _$$_FamilyCopyWith<$Res> {
  __$$_FamilyCopyWithImpl(_$_Family _value, $Res Function(_$_Family) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? attributes = null,
    Object? attributeAsLabel = freezed,
    Object? attributeAsImage = freezed,
    Object? attributeRequirements = null,
    Object? labels = null,
  }) {
    return _then(_$_Family(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attributeAsLabel: freezed == attributeAsLabel
          ? _value.attributeAsLabel
          : attributeAsLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      attributeAsImage: freezed == attributeAsImage
          ? _value.attributeAsImage
          : attributeAsImage // ignore: cast_nullable_to_non_nullable
              as String?,
      attributeRequirements: null == attributeRequirements
          ? _value._attributeRequirements
          : attributeRequirements // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Family implements _Family {
  const _$_Family(
      {this.links,
      required this.code,
      required final List<String> attributes,
      @JsonKey(name: 'attribute_as_label') this.attributeAsLabel,
      @JsonKey(name: 'attribute_as_image') this.attributeAsImage,
      @JsonKey(name: 'attribute_requirements')
      final Map<String, List<String>> attributeRequirements = const {},
      final Map<String, String?> labels = const {}})
      : _attributes = attributes,
        _attributeRequirements = attributeRequirements,
        _labels = labels;

  factory _$_Family.fromJson(Map<String, dynamic> json) =>
      _$$_FamilyFromJson(json);

  @override
  final Links? links;
  @override
  final String code;
  final List<String> _attributes;
  @override
  List<String> get attributes {
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributes);
  }

  @override
  @JsonKey(name: 'attribute_as_label')
  final String? attributeAsLabel;
  @override
  @JsonKey(name: 'attribute_as_image')
  final String? attributeAsImage;
  final Map<String, List<String>> _attributeRequirements;
  @override
  @JsonKey(name: 'attribute_requirements')
  Map<String, List<String>> get attributeRequirements {
    if (_attributeRequirements is EqualUnmodifiableMapView)
      return _attributeRequirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributeRequirements);
  }

  final Map<String, String?> _labels;
  @override
  @JsonKey()
  Map<String, String?> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  @override
  String toString() {
    return 'Family(links: $links, code: $code, attributes: $attributes, attributeAsLabel: $attributeAsLabel, attributeAsImage: $attributeAsImage, attributeRequirements: $attributeRequirements, labels: $labels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Family &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.attributeAsLabel, attributeAsLabel) ||
                other.attributeAsLabel == attributeAsLabel) &&
            (identical(other.attributeAsImage, attributeAsImage) ||
                other.attributeAsImage == attributeAsImage) &&
            const DeepCollectionEquality()
                .equals(other._attributeRequirements, _attributeRequirements) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      links,
      code,
      const DeepCollectionEquality().hash(_attributes),
      attributeAsLabel,
      attributeAsImage,
      const DeepCollectionEquality().hash(_attributeRequirements),
      const DeepCollectionEquality().hash(_labels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FamilyCopyWith<_$_Family> get copyWith =>
      __$$_FamilyCopyWithImpl<_$_Family>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FamilyToJson(
      this,
    );
  }
}

abstract class _Family implements Family {
  const factory _Family(
      {final Links? links,
      required final String code,
      required final List<String> attributes,
      @JsonKey(name: 'attribute_as_label') final String? attributeAsLabel,
      @JsonKey(name: 'attribute_as_image') final String? attributeAsImage,
      @JsonKey(name: 'attribute_requirements')
      final Map<String, List<String>> attributeRequirements,
      final Map<String, String?> labels}) = _$_Family;

  factory _Family.fromJson(Map<String, dynamic> json) = _$_Family.fromJson;

  @override
  Links? get links;
  @override
  String get code;
  @override
  List<String> get attributes;
  @override
  @JsonKey(name: 'attribute_as_label')
  String? get attributeAsLabel;
  @override
  @JsonKey(name: 'attribute_as_image')
  String? get attributeAsImage;
  @override
  @JsonKey(name: 'attribute_requirements')
  Map<String, List<String>> get attributeRequirements;
  @override
  Map<String, String?> get labels;
  @override
  @JsonKey(ignore: true)
  _$$_FamilyCopyWith<_$_Family> get copyWith =>
      throw _privateConstructorUsedError;
}

FamilyVariant _$FamilyVariantFromJson(Map<String, dynamic> json) {
  return _FamilyVariant.fromJson(json);
}

/// @nodoc
mixin _$FamilyVariant {
  Links? get links => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  Map<String, String?> get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'variant_attribute_sets')
  List<VariantAttributeSet> get variantAttributeSets =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FamilyVariantCopyWith<FamilyVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyVariantCopyWith<$Res> {
  factory $FamilyVariantCopyWith(
          FamilyVariant value, $Res Function(FamilyVariant) then) =
      _$FamilyVariantCopyWithImpl<$Res, FamilyVariant>;
  @useResult
  $Res call(
      {Links? links,
      String code,
      Map<String, String?> labels,
      @JsonKey(name: 'variant_attribute_sets')
      List<VariantAttributeSet> variantAttributeSets});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$FamilyVariantCopyWithImpl<$Res, $Val extends FamilyVariant>
    implements $FamilyVariantCopyWith<$Res> {
  _$FamilyVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? labels = null,
    Object? variantAttributeSets = null,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      variantAttributeSets: null == variantAttributeSets
          ? _value.variantAttributeSets
          : variantAttributeSets // ignore: cast_nullable_to_non_nullable
              as List<VariantAttributeSet>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FamilyVariantCopyWith<$Res>
    implements $FamilyVariantCopyWith<$Res> {
  factory _$$_FamilyVariantCopyWith(
          _$_FamilyVariant value, $Res Function(_$_FamilyVariant) then) =
      __$$_FamilyVariantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Links? links,
      String code,
      Map<String, String?> labels,
      @JsonKey(name: 'variant_attribute_sets')
      List<VariantAttributeSet> variantAttributeSets});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_FamilyVariantCopyWithImpl<$Res>
    extends _$FamilyVariantCopyWithImpl<$Res, _$_FamilyVariant>
    implements _$$_FamilyVariantCopyWith<$Res> {
  __$$_FamilyVariantCopyWithImpl(
      _$_FamilyVariant _value, $Res Function(_$_FamilyVariant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? labels = null,
    Object? variantAttributeSets = null,
  }) {
    return _then(_$_FamilyVariant(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      variantAttributeSets: null == variantAttributeSets
          ? _value._variantAttributeSets
          : variantAttributeSets // ignore: cast_nullable_to_non_nullable
              as List<VariantAttributeSet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FamilyVariant implements _FamilyVariant {
  const _$_FamilyVariant(
      {this.links,
      required this.code,
      final Map<String, String?> labels = const {},
      @JsonKey(name: 'variant_attribute_sets')
      required final List<VariantAttributeSet> variantAttributeSets})
      : _labels = labels,
        _variantAttributeSets = variantAttributeSets;

  factory _$_FamilyVariant.fromJson(Map<String, dynamic> json) =>
      _$$_FamilyVariantFromJson(json);

  @override
  final Links? links;
  @override
  final String code;
  final Map<String, String?> _labels;
  @override
  @JsonKey()
  Map<String, String?> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  final List<VariantAttributeSet> _variantAttributeSets;
  @override
  @JsonKey(name: 'variant_attribute_sets')
  List<VariantAttributeSet> get variantAttributeSets {
    if (_variantAttributeSets is EqualUnmodifiableListView)
      return _variantAttributeSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variantAttributeSets);
  }

  @override
  String toString() {
    return 'FamilyVariant(links: $links, code: $code, labels: $labels, variantAttributeSets: $variantAttributeSets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FamilyVariant &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            const DeepCollectionEquality()
                .equals(other._variantAttributeSets, _variantAttributeSets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      links,
      code,
      const DeepCollectionEquality().hash(_labels),
      const DeepCollectionEquality().hash(_variantAttributeSets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FamilyVariantCopyWith<_$_FamilyVariant> get copyWith =>
      __$$_FamilyVariantCopyWithImpl<_$_FamilyVariant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FamilyVariantToJson(
      this,
    );
  }
}

abstract class _FamilyVariant implements FamilyVariant {
  const factory _FamilyVariant(
          {final Links? links,
          required final String code,
          final Map<String, String?> labels,
          @JsonKey(name: 'variant_attribute_sets')
          required final List<VariantAttributeSet> variantAttributeSets}) =
      _$_FamilyVariant;

  factory _FamilyVariant.fromJson(Map<String, dynamic> json) =
      _$_FamilyVariant.fromJson;

  @override
  Links? get links;
  @override
  String get code;
  @override
  Map<String, String?> get labels;
  @override
  @JsonKey(name: 'variant_attribute_sets')
  List<VariantAttributeSet> get variantAttributeSets;
  @override
  @JsonKey(ignore: true)
  _$$_FamilyVariantCopyWith<_$_FamilyVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

VariantAttributeSet _$VariantAttributeSetFromJson(Map<String, dynamic> json) {
  return _VariantAttributeSet.fromJson(json);
}

/// @nodoc
mixin _$VariantAttributeSet {
  int get level => throw _privateConstructorUsedError;
  List<String> get axes => throw _privateConstructorUsedError;
  List<String> get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantAttributeSetCopyWith<VariantAttributeSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantAttributeSetCopyWith<$Res> {
  factory $VariantAttributeSetCopyWith(
          VariantAttributeSet value, $Res Function(VariantAttributeSet) then) =
      _$VariantAttributeSetCopyWithImpl<$Res, VariantAttributeSet>;
  @useResult
  $Res call({int level, List<String> axes, List<String> attributes});
}

/// @nodoc
class _$VariantAttributeSetCopyWithImpl<$Res, $Val extends VariantAttributeSet>
    implements $VariantAttributeSetCopyWith<$Res> {
  _$VariantAttributeSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? axes = null,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      axes: null == axes
          ? _value.axes
          : axes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VariantAttributeSetCopyWith<$Res>
    implements $VariantAttributeSetCopyWith<$Res> {
  factory _$$_VariantAttributeSetCopyWith(_$_VariantAttributeSet value,
          $Res Function(_$_VariantAttributeSet) then) =
      __$$_VariantAttributeSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, List<String> axes, List<String> attributes});
}

/// @nodoc
class __$$_VariantAttributeSetCopyWithImpl<$Res>
    extends _$VariantAttributeSetCopyWithImpl<$Res, _$_VariantAttributeSet>
    implements _$$_VariantAttributeSetCopyWith<$Res> {
  __$$_VariantAttributeSetCopyWithImpl(_$_VariantAttributeSet _value,
      $Res Function(_$_VariantAttributeSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? axes = null,
    Object? attributes = null,
  }) {
    return _then(_$_VariantAttributeSet(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      axes: null == axes
          ? _value._axes
          : axes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VariantAttributeSet implements _VariantAttributeSet {
  const _$_VariantAttributeSet(
      {required this.level,
      required final List<String> axes,
      final List<String> attributes = const []})
      : _axes = axes,
        _attributes = attributes;

  factory _$_VariantAttributeSet.fromJson(Map<String, dynamic> json) =>
      _$$_VariantAttributeSetFromJson(json);

  @override
  final int level;
  final List<String> _axes;
  @override
  List<String> get axes {
    if (_axes is EqualUnmodifiableListView) return _axes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_axes);
  }

  final List<String> _attributes;
  @override
  @JsonKey()
  List<String> get attributes {
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributes);
  }

  @override
  String toString() {
    return 'VariantAttributeSet(level: $level, axes: $axes, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VariantAttributeSet &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(other._axes, _axes) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      level,
      const DeepCollectionEquality().hash(_axes),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VariantAttributeSetCopyWith<_$_VariantAttributeSet> get copyWith =>
      __$$_VariantAttributeSetCopyWithImpl<_$_VariantAttributeSet>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VariantAttributeSetToJson(
      this,
    );
  }
}

abstract class _VariantAttributeSet implements VariantAttributeSet {
  const factory _VariantAttributeSet(
      {required final int level,
      required final List<String> axes,
      final List<String> attributes}) = _$_VariantAttributeSet;

  factory _VariantAttributeSet.fromJson(Map<String, dynamic> json) =
      _$_VariantAttributeSet.fromJson;

  @override
  int get level;
  @override
  List<String> get axes;
  @override
  List<String> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_VariantAttributeSetCopyWith<_$_VariantAttributeSet> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  Links? get links => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  bool? get enabled => throw _privateConstructorUsedError;
  String? get family => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<String> get groups => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  Map<String, List<Value>> get values => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;
  String? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {Links? links,
      String identifier,
      bool? enabled,
      String? family,
      List<String> categories,
      List<String> groups,
      String? parent,
      Map<String, List<Value>> values,
      String? created,
      String? updated});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? identifier = null,
    Object? enabled = freezed,
    Object? family = freezed,
    Object? categories = null,
    Object? groups = null,
    Object? parent = freezed,
    Object? values = null,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Value>>,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Links? links,
      String identifier,
      bool? enabled,
      String? family,
      List<String> categories,
      List<String> groups,
      String? parent,
      Map<String, List<Value>> values,
      String? created,
      String? updated});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? identifier = null,
    Object? enabled = freezed,
    Object? family = freezed,
    Object? categories = null,
    Object? groups = null,
    Object? parent = freezed,
    Object? values = null,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$_Product(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Value>>,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  const _$_Product(
      {this.links,
      required this.identifier,
      this.enabled,
      this.family,
      final List<String> categories = const [],
      final List<String> groups = const [],
      this.parent,
      final Map<String, List<Value>> values = const {},
      this.created,
      this.updated})
      : _categories = categories,
        _groups = groups,
        _values = values;

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final Links? links;
  @override
  final String identifier;
  @override
  final bool? enabled;
  @override
  final String? family;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<String> _groups;
  @override
  @JsonKey()
  List<String> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final String? parent;
  final Map<String, List<Value>> _values;
  @override
  @JsonKey()
  Map<String, List<Value>> get values {
    if (_values is EqualUnmodifiableMapView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_values);
  }

  @override
  final String? created;
  @override
  final String? updated;

  @override
  String toString() {
    return 'Product(links: $links, identifier: $identifier, enabled: $enabled, family: $family, categories: $categories, groups: $groups, parent: $parent, values: $values, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.family, family) || other.family == family) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      links,
      identifier,
      enabled,
      family,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_groups),
      parent,
      const DeepCollectionEquality().hash(_values),
      created,
      updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {final Links? links,
      required final String identifier,
      final bool? enabled,
      final String? family,
      final List<String> categories,
      final List<String> groups,
      final String? parent,
      final Map<String, List<Value>> values,
      final String? created,
      final String? updated}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  Links? get links;
  @override
  String get identifier;
  @override
  bool? get enabled;
  @override
  String? get family;
  @override
  List<String> get categories;
  @override
  List<String> get groups;
  @override
  String? get parent;
  @override
  Map<String, List<Value>> get values;
  @override
  String? get created;
  @override
  String? get updated;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  Links? get links => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'family_variant')
  String get familyVariant => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  Map<String, List<Value>> get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {Links? links,
      String code,
      @JsonKey(name: 'family_variant') String familyVariant,
      String? parent,
      List<String> categories,
      Map<String, List<Value>> values});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? familyVariant = null,
    Object? parent = freezed,
    Object? categories = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      familyVariant: null == familyVariant
          ? _value.familyVariant
          : familyVariant // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Value>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Links? links,
      String code,
      @JsonKey(name: 'family_variant') String familyVariant,
      String? parent,
      List<String> categories,
      Map<String, List<Value>> values});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? code = null,
    Object? familyVariant = null,
    Object? parent = freezed,
    Object? categories = null,
    Object? values = null,
  }) {
    return _then(_$_ProductModel(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      familyVariant: null == familyVariant
          ? _value.familyVariant
          : familyVariant // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Value>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  const _$_ProductModel(
      {this.links,
      required this.code,
      @JsonKey(name: 'family_variant') required this.familyVariant,
      this.parent,
      final List<String> categories = const [],
      final Map<String, List<Value>> values = const {}})
      : _categories = categories,
        _values = values;

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final Links? links;
  @override
  final String code;
  @override
  @JsonKey(name: 'family_variant')
  final String familyVariant;
  @override
  final String? parent;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final Map<String, List<Value>> _values;
  @override
  @JsonKey()
  Map<String, List<Value>> get values {
    if (_values is EqualUnmodifiableMapView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_values);
  }

  @override
  String toString() {
    return 'ProductModel(links: $links, code: $code, familyVariant: $familyVariant, parent: $parent, categories: $categories, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.familyVariant, familyVariant) ||
                other.familyVariant == familyVariant) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      links,
      code,
      familyVariant,
      parent,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {final Links? links,
      required final String code,
      @JsonKey(name: 'family_variant') required final String familyVariant,
      final String? parent,
      final List<String> categories,
      final Map<String, List<Value>> values}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  Links? get links;
  @override
  String get code;
  @override
  @JsonKey(name: 'family_variant')
  String get familyVariant;
  @override
  String? get parent;
  @override
  List<String> get categories;
  @override
  Map<String, List<Value>> get values;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return _ErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponse {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: '_links')
  Links? get links => throw _privateConstructorUsedError;
  List<ApiError>? get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseCopyWith<ErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseCopyWith<$Res> {
  factory $ErrorResponseCopyWith(
          ErrorResponse value, $Res Function(ErrorResponse) then) =
      _$ErrorResponseCopyWithImpl<$Res, ErrorResponse>;
  @useResult
  $Res call(
      {int code,
      String message,
      @JsonKey(name: '_links') Links? links,
      List<ApiError>? errors});

  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$ErrorResponseCopyWithImpl<$Res, $Val extends ErrorResponse>
    implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? links = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ApiError>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ErrorResponseCopyWith<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  factory _$$_ErrorResponseCopyWith(
          _$_ErrorResponse value, $Res Function(_$_ErrorResponse) then) =
      __$$_ErrorResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int code,
      String message,
      @JsonKey(name: '_links') Links? links,
      List<ApiError>? errors});

  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$_ErrorResponseCopyWithImpl<$Res>
    extends _$ErrorResponseCopyWithImpl<$Res, _$_ErrorResponse>
    implements _$$_ErrorResponseCopyWith<$Res> {
  __$$_ErrorResponseCopyWithImpl(
      _$_ErrorResponse _value, $Res Function(_$_ErrorResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? links = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$_ErrorResponse(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ApiError>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorResponse implements _ErrorResponse {
  const _$_ErrorResponse(
      {required this.code,
      required this.message,
      @JsonKey(name: '_links') this.links,
      final List<ApiError>? errors})
      : _errors = errors;

  factory _$_ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorResponseFromJson(json);

  @override
  final int code;
  @override
  final String message;
  @override
  @JsonKey(name: '_links')
  final Links? links;
  final List<ApiError>? _errors;
  @override
  List<ApiError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ErrorResponse(code: $code, message: $message, links: $links, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorResponse &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.links, links) || other.links == links) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, links,
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorResponseCopyWith<_$_ErrorResponse> get copyWith =>
      __$$_ErrorResponseCopyWithImpl<_$_ErrorResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorResponseToJson(
      this,
    );
  }
}

abstract class _ErrorResponse implements ErrorResponse {
  const factory _ErrorResponse(
      {required final int code,
      required final String message,
      @JsonKey(name: '_links') final Links? links,
      final List<ApiError>? errors}) = _$_ErrorResponse;

  factory _ErrorResponse.fromJson(Map<String, dynamic> json) =
      _$_ErrorResponse.fromJson;

  @override
  int get code;
  @override
  String get message;
  @override
  @JsonKey(name: '_links')
  Links? get links;
  @override
  List<ApiError>? get errors;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorResponseCopyWith<_$_ErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

AkeneoPaginatedResponse _$AkeneoPaginatedResponseFromJson(
    Map<String, dynamic> json) {
  return _AkeneoPaginatedResponse.fromJson(json);
}

/// @nodoc
mixin _$AkeneoPaginatedResponse {
  @JsonKey(name: '_links')
  Links get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int? get itemCount => throw _privateConstructorUsedError;
  @JsonKey(name: '_embedded')
  Embedded get embedded => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AkeneoPaginatedResponseCopyWith<AkeneoPaginatedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AkeneoPaginatedResponseCopyWith<$Res> {
  factory $AkeneoPaginatedResponseCopyWith(AkeneoPaginatedResponse value,
          $Res Function(AkeneoPaginatedResponse) then) =
      _$AkeneoPaginatedResponseCopyWithImpl<$Res, AkeneoPaginatedResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '_links') Links links,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'items_count') int? itemCount,
      @JsonKey(name: '_embedded') Embedded embedded});

  $LinksCopyWith<$Res> get links;
  $EmbeddedCopyWith<$Res> get embedded;
}

/// @nodoc
class _$AkeneoPaginatedResponseCopyWithImpl<$Res,
        $Val extends AkeneoPaginatedResponse>
    implements $AkeneoPaginatedResponseCopyWith<$Res> {
  _$AkeneoPaginatedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = null,
    Object? currentPage = null,
    Object? itemCount = freezed,
    Object? embedded = null,
  }) {
    return _then(_value.copyWith(
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemCount: freezed == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      embedded: null == embedded
          ? _value.embedded
          : embedded // ignore: cast_nullable_to_non_nullable
              as Embedded,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res> get links {
    return $LinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EmbeddedCopyWith<$Res> get embedded {
    return $EmbeddedCopyWith<$Res>(_value.embedded, (value) {
      return _then(_value.copyWith(embedded: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AkeneoPaginatedResponseCopyWith<$Res>
    implements $AkeneoPaginatedResponseCopyWith<$Res> {
  factory _$$_AkeneoPaginatedResponseCopyWith(_$_AkeneoPaginatedResponse value,
          $Res Function(_$_AkeneoPaginatedResponse) then) =
      __$$_AkeneoPaginatedResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_links') Links links,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'items_count') int? itemCount,
      @JsonKey(name: '_embedded') Embedded embedded});

  @override
  $LinksCopyWith<$Res> get links;
  @override
  $EmbeddedCopyWith<$Res> get embedded;
}

/// @nodoc
class __$$_AkeneoPaginatedResponseCopyWithImpl<$Res>
    extends _$AkeneoPaginatedResponseCopyWithImpl<$Res,
        _$_AkeneoPaginatedResponse>
    implements _$$_AkeneoPaginatedResponseCopyWith<$Res> {
  __$$_AkeneoPaginatedResponseCopyWithImpl(_$_AkeneoPaginatedResponse _value,
      $Res Function(_$_AkeneoPaginatedResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = null,
    Object? currentPage = null,
    Object? itemCount = freezed,
    Object? embedded = null,
  }) {
    return _then(_$_AkeneoPaginatedResponse(
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemCount: freezed == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      embedded: null == embedded
          ? _value.embedded
          : embedded // ignore: cast_nullable_to_non_nullable
              as Embedded,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AkeneoPaginatedResponse implements _AkeneoPaginatedResponse {
  const _$_AkeneoPaginatedResponse(
      {@JsonKey(name: '_links') required this.links,
      @JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'items_count') this.itemCount,
      @JsonKey(name: '_embedded') required this.embedded});

  factory _$_AkeneoPaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AkeneoPaginatedResponseFromJson(json);

  @override
  @JsonKey(name: '_links')
  final Links links;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'items_count')
  final int? itemCount;
  @override
  @JsonKey(name: '_embedded')
  final Embedded embedded;

  @override
  String toString() {
    return 'AkeneoPaginatedResponse(links: $links, currentPage: $currentPage, itemCount: $itemCount, embedded: $embedded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AkeneoPaginatedResponse &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.embedded, embedded) ||
                other.embedded == embedded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, links, currentPage, itemCount, embedded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AkeneoPaginatedResponseCopyWith<_$_AkeneoPaginatedResponse>
      get copyWith =>
          __$$_AkeneoPaginatedResponseCopyWithImpl<_$_AkeneoPaginatedResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AkeneoPaginatedResponseToJson(
      this,
    );
  }
}

abstract class _AkeneoPaginatedResponse implements AkeneoPaginatedResponse {
  const factory _AkeneoPaginatedResponse(
          {@JsonKey(name: '_links') required final Links links,
          @JsonKey(name: 'current_page') required final int currentPage,
          @JsonKey(name: 'items_count') final int? itemCount,
          @JsonKey(name: '_embedded') required final Embedded embedded}) =
      _$_AkeneoPaginatedResponse;

  factory _AkeneoPaginatedResponse.fromJson(Map<String, dynamic> json) =
      _$_AkeneoPaginatedResponse.fromJson;

  @override
  @JsonKey(name: '_links')
  Links get links;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'items_count')
  int? get itemCount;
  @override
  @JsonKey(name: '_embedded')
  Embedded get embedded;
  @override
  @JsonKey(ignore: true)
  _$$_AkeneoPaginatedResponseCopyWith<_$_AkeneoPaginatedResponse>
      get copyWith => throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  UrlReference? get self => throw _privateConstructorUsedError;
  UrlReference? get first => throw _privateConstructorUsedError;
  UrlReference? get next => throw _privateConstructorUsedError;
  UrlReference? get previous => throw _privateConstructorUsedError;
  UrlReference? get documentation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call(
      {UrlReference? self,
      UrlReference? first,
      UrlReference? next,
      UrlReference? previous,
      UrlReference? documentation});

  $UrlReferenceCopyWith<$Res>? get self;
  $UrlReferenceCopyWith<$Res>? get first;
  $UrlReferenceCopyWith<$Res>? get next;
  $UrlReferenceCopyWith<$Res>? get previous;
  $UrlReferenceCopyWith<$Res>? get documentation;
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
    Object? first = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? documentation = freezed,
  }) {
    return _then(_value.copyWith(
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      documentation: freezed == documentation
          ? _value.documentation
          : documentation // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlReferenceCopyWith<$Res>? get self {
    if (_value.self == null) {
      return null;
    }

    return $UrlReferenceCopyWith<$Res>(_value.self!, (value) {
      return _then(_value.copyWith(self: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlReferenceCopyWith<$Res>? get first {
    if (_value.first == null) {
      return null;
    }

    return $UrlReferenceCopyWith<$Res>(_value.first!, (value) {
      return _then(_value.copyWith(first: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlReferenceCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $UrlReferenceCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlReferenceCopyWith<$Res>? get previous {
    if (_value.previous == null) {
      return null;
    }

    return $UrlReferenceCopyWith<$Res>(_value.previous!, (value) {
      return _then(_value.copyWith(previous: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlReferenceCopyWith<$Res>? get documentation {
    if (_value.documentation == null) {
      return null;
    }

    return $UrlReferenceCopyWith<$Res>(_value.documentation!, (value) {
      return _then(_value.copyWith(documentation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LinksCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$_LinksCopyWith(_$_Links value, $Res Function(_$_Links) then) =
      __$$_LinksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UrlReference? self,
      UrlReference? first,
      UrlReference? next,
      UrlReference? previous,
      UrlReference? documentation});

  @override
  $UrlReferenceCopyWith<$Res>? get self;
  @override
  $UrlReferenceCopyWith<$Res>? get first;
  @override
  $UrlReferenceCopyWith<$Res>? get next;
  @override
  $UrlReferenceCopyWith<$Res>? get previous;
  @override
  $UrlReferenceCopyWith<$Res>? get documentation;
}

/// @nodoc
class __$$_LinksCopyWithImpl<$Res> extends _$LinksCopyWithImpl<$Res, _$_Links>
    implements _$$_LinksCopyWith<$Res> {
  __$$_LinksCopyWithImpl(_$_Links _value, $Res Function(_$_Links) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
    Object? first = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? documentation = freezed,
  }) {
    return _then(_$_Links(
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
      documentation: freezed == documentation
          ? _value.documentation
          : documentation // ignore: cast_nullable_to_non_nullable
              as UrlReference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Links implements _Links {
  const _$_Links(
      {this.self, this.first, this.next, this.previous, this.documentation});

  factory _$_Links.fromJson(Map<String, dynamic> json) =>
      _$$_LinksFromJson(json);

  @override
  final UrlReference? self;
  @override
  final UrlReference? first;
  @override
  final UrlReference? next;
  @override
  final UrlReference? previous;
  @override
  final UrlReference? documentation;

  @override
  String toString() {
    return 'Links(self: $self, first: $first, next: $next, previous: $previous, documentation: $documentation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Links &&
            (identical(other.self, self) || other.self == self) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.documentation, documentation) ||
                other.documentation == documentation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, self, first, next, previous, documentation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinksCopyWith<_$_Links> get copyWith =>
      __$$_LinksCopyWithImpl<_$_Links>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinksToJson(
      this,
    );
  }
}

abstract class _Links implements Links {
  const factory _Links(
      {final UrlReference? self,
      final UrlReference? first,
      final UrlReference? next,
      final UrlReference? previous,
      final UrlReference? documentation}) = _$_Links;

  factory _Links.fromJson(Map<String, dynamic> json) = _$_Links.fromJson;

  @override
  UrlReference? get self;
  @override
  UrlReference? get first;
  @override
  UrlReference? get next;
  @override
  UrlReference? get previous;
  @override
  UrlReference? get documentation;
  @override
  @JsonKey(ignore: true)
  _$$_LinksCopyWith<_$_Links> get copyWith =>
      throw _privateConstructorUsedError;
}

UrlReference _$UrlReferenceFromJson(Map<String, dynamic> json) {
  return _UrlReference.fromJson(json);
}

/// @nodoc
mixin _$UrlReference {
  String get href => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UrlReferenceCopyWith<UrlReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlReferenceCopyWith<$Res> {
  factory $UrlReferenceCopyWith(
          UrlReference value, $Res Function(UrlReference) then) =
      _$UrlReferenceCopyWithImpl<$Res, UrlReference>;
  @useResult
  $Res call({String href});
}

/// @nodoc
class _$UrlReferenceCopyWithImpl<$Res, $Val extends UrlReference>
    implements $UrlReferenceCopyWith<$Res> {
  _$UrlReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = null,
  }) {
    return _then(_value.copyWith(
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UrlReferenceCopyWith<$Res>
    implements $UrlReferenceCopyWith<$Res> {
  factory _$$_UrlReferenceCopyWith(
          _$_UrlReference value, $Res Function(_$_UrlReference) then) =
      __$$_UrlReferenceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String href});
}

/// @nodoc
class __$$_UrlReferenceCopyWithImpl<$Res>
    extends _$UrlReferenceCopyWithImpl<$Res, _$_UrlReference>
    implements _$$_UrlReferenceCopyWith<$Res> {
  __$$_UrlReferenceCopyWithImpl(
      _$_UrlReference _value, $Res Function(_$_UrlReference) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = null,
  }) {
    return _then(_$_UrlReference(
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UrlReference implements _UrlReference {
  const _$_UrlReference({required this.href});

  factory _$_UrlReference.fromJson(Map<String, dynamic> json) =>
      _$$_UrlReferenceFromJson(json);

  @override
  final String href;

  @override
  String toString() {
    return 'UrlReference(href: $href)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UrlReference &&
            (identical(other.href, href) || other.href == href));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, href);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UrlReferenceCopyWith<_$_UrlReference> get copyWith =>
      __$$_UrlReferenceCopyWithImpl<_$_UrlReference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UrlReferenceToJson(
      this,
    );
  }
}

abstract class _UrlReference implements UrlReference {
  const factory _UrlReference({required final String href}) = _$_UrlReference;

  factory _UrlReference.fromJson(Map<String, dynamic> json) =
      _$_UrlReference.fromJson;

  @override
  String get href;
  @override
  @JsonKey(ignore: true)
  _$$_UrlReferenceCopyWith<_$_UrlReference> get copyWith =>
      throw _privateConstructorUsedError;
}

Embedded _$EmbeddedFromJson(Map<String, dynamic> json) {
  return _Embedded.fromJson(json);
}

/// @nodoc
mixin _$Embedded {
  List<dynamic> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbeddedCopyWith<Embedded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddedCopyWith<$Res> {
  factory $EmbeddedCopyWith(Embedded value, $Res Function(Embedded) then) =
      _$EmbeddedCopyWithImpl<$Res, Embedded>;
  @useResult
  $Res call({List<dynamic> items});
}

/// @nodoc
class _$EmbeddedCopyWithImpl<$Res, $Val extends Embedded>
    implements $EmbeddedCopyWith<$Res> {
  _$EmbeddedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmbeddedCopyWith<$Res> implements $EmbeddedCopyWith<$Res> {
  factory _$$_EmbeddedCopyWith(
          _$_Embedded value, $Res Function(_$_Embedded) then) =
      __$$_EmbeddedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> items});
}

/// @nodoc
class __$$_EmbeddedCopyWithImpl<$Res>
    extends _$EmbeddedCopyWithImpl<$Res, _$_Embedded>
    implements _$$_EmbeddedCopyWith<$Res> {
  __$$_EmbeddedCopyWithImpl(
      _$_Embedded _value, $Res Function(_$_Embedded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_Embedded(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Embedded implements _Embedded {
  const _$_Embedded({required final List<dynamic> items}) : _items = items;

  factory _$_Embedded.fromJson(Map<String, dynamic> json) =>
      _$$_EmbeddedFromJson(json);

  final List<dynamic> _items;
  @override
  List<dynamic> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Embedded(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Embedded &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmbeddedCopyWith<_$_Embedded> get copyWith =>
      __$$_EmbeddedCopyWithImpl<_$_Embedded>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmbeddedToJson(
      this,
    );
  }
}

abstract class _Embedded implements Embedded {
  const factory _Embedded({required final List<dynamic> items}) = _$_Embedded;

  factory _Embedded.fromJson(Map<String, dynamic> json) = _$_Embedded.fromJson;

  @override
  List<dynamic> get items;
  @override
  @JsonKey(ignore: true)
  _$$_EmbeddedCopyWith<_$_Embedded> get copyWith =>
      throw _privateConstructorUsedError;
}

Value _$ValueFromJson(Map<String, dynamic> json) {
  return _Value.fromJson(json);
}

/// @nodoc
mixin _$Value {
  String? get locale => throw _privateConstructorUsedError;
  String? get scope => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValueCopyWith<Value> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueCopyWith<$Res> {
  factory $ValueCopyWith(Value value, $Res Function(Value) then) =
      _$ValueCopyWithImpl<$Res, Value>;
  @useResult
  $Res call({String? locale, String? scope, dynamic data});
}

/// @nodoc
class _$ValueCopyWithImpl<$Res, $Val extends Value>
    implements $ValueCopyWith<$Res> {
  _$ValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? scope = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValueCopyWith<$Res> implements $ValueCopyWith<$Res> {
  factory _$$_ValueCopyWith(_$_Value value, $Res Function(_$_Value) then) =
      __$$_ValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? locale, String? scope, dynamic data});
}

/// @nodoc
class __$$_ValueCopyWithImpl<$Res> extends _$ValueCopyWithImpl<$Res, _$_Value>
    implements _$$_ValueCopyWith<$Res> {
  __$$_ValueCopyWithImpl(_$_Value _value, $Res Function(_$_Value) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? scope = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_Value(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Value implements _Value {
  const _$_Value({this.locale, this.scope, this.data});

  factory _$_Value.fromJson(Map<String, dynamic> json) =>
      _$$_ValueFromJson(json);

  @override
  final String? locale;
  @override
  final String? scope;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'Value(locale: $locale, scope: $scope, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Value &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, locale, scope, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValueCopyWith<_$_Value> get copyWith =>
      __$$_ValueCopyWithImpl<_$_Value>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValueToJson(
      this,
    );
  }
}

abstract class _Value implements Value {
  const factory _Value(
      {final String? locale,
      final String? scope,
      final dynamic data}) = _$_Value;

  factory _Value.fromJson(Map<String, dynamic> json) = _$_Value.fromJson;

  @override
  String? get locale;
  @override
  String? get scope;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$_ValueCopyWith<_$_Value> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return _ApiError.fromJson(json);
}

/// @nodoc
mixin _$ApiError {
  String? get property => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get attribute => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;
  String? get scope => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiErrorCopyWith<ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res, ApiError>;
  @useResult
  $Res call(
      {String? property,
      String? message,
      String? attribute,
      String? locale,
      String? scope});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res, $Val extends ApiError>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = freezed,
    Object? message = freezed,
    Object? attribute = freezed,
    Object? locale = freezed,
    Object? scope = freezed,
  }) {
    return _then(_value.copyWith(
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      attribute: freezed == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiErrorCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$$_ApiErrorCopyWith(
          _$_ApiError value, $Res Function(_$_ApiError) then) =
      __$$_ApiErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? property,
      String? message,
      String? attribute,
      String? locale,
      String? scope});
}

/// @nodoc
class __$$_ApiErrorCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$_ApiError>
    implements _$$_ApiErrorCopyWith<$Res> {
  __$$_ApiErrorCopyWithImpl(
      _$_ApiError _value, $Res Function(_$_ApiError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = freezed,
    Object? message = freezed,
    Object? attribute = freezed,
    Object? locale = freezed,
    Object? scope = freezed,
  }) {
    return _then(_$_ApiError(
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      attribute: freezed == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiError implements _ApiError {
  _$_ApiError(
      {this.property, this.message, this.attribute, this.locale, this.scope});

  factory _$_ApiError.fromJson(Map<String, dynamic> json) =>
      _$$_ApiErrorFromJson(json);

  @override
  final String? property;
  @override
  final String? message;
  @override
  final String? attribute;
  @override
  final String? locale;
  @override
  final String? scope;

  @override
  String toString() {
    return 'ApiError(property: $property, message: $message, attribute: $attribute, locale: $locale, scope: $scope)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiError &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.scope, scope) || other.scope == scope));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, property, message, attribute, locale, scope);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      __$$_ApiErrorCopyWithImpl<_$_ApiError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiErrorToJson(
      this,
    );
  }
}

abstract class _ApiError implements ApiError {
  factory _ApiError(
      {final String? property,
      final String? message,
      final String? attribute,
      final String? locale,
      final String? scope}) = _$_ApiError;

  factory _ApiError.fromJson(Map<String, dynamic> json) = _$_ApiError.fromJson;

  @override
  String? get property;
  @override
  String? get message;
  @override
  String? get attribute;
  @override
  String? get locale;
  @override
  String? get scope;
  @override
  @JsonKey(ignore: true)
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}
