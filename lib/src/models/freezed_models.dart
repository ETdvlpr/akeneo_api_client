import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_models.freezed.dart';
part 'freezed_models.g.dart';

@freezed
class Attribute with _$Attribute {
  const factory Attribute({
    required String code,
    required String type,
    required String group,
    @Default(false) bool unique,
    @Default(false)
    @JsonKey(name: 'useable_as_grid_filter')
    bool useableAsGridFilter,
    @Default([])
    @JsonKey(name: 'allowed_extensions')
    List<String> allowedExtensions,
    @JsonKey(name: 'metric_family') String? metricFamily,
    @JsonKey(name: 'default_metric_unit') String? defaultMetricUnit,
    @JsonKey(name: 'reference_data_name') String? referenceDataName,
    @Default([])
    @JsonKey(name: 'available_locales')
    List<String> availableLocales,
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
    @Default(0) @JsonKey(name: 'sort_order') int sortOrder,
    @Default(false) bool localizable,
    @Default(false) bool scopable,
    @Default({}) Map<String, String> labels,
    @JsonKey(name: 'auto_option_sorting') bool? autoOptionSorting,
  }) = _Attribute;

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
}

@freezed
class AttributeGroup with _$AttributeGroup {
  const factory AttributeGroup({
    Links? links,
    required String code,
    @JsonKey(name: 'sort_order') int? sortOrder,
    List<String>? attributes,
    @Default({}) Map<String, String?> labels,
  }) = _AttributeGroup;

  factory AttributeGroup.fromJson(Map<String, dynamic> json) =>
      _$AttributeGroupFromJson(json);
}

@freezed
class AttributeOption with _$AttributeOption {
  const factory AttributeOption({
    Links? links,
    required String code,
    required String attribute,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @Default({}) Map<String, String?> labels,
  }) = _AttributeOption;

  factory AttributeOption.fromJson(Map<String, dynamic> json) =>
      _$AttributeOptionFromJson(json);
}

@freezed
class Channel with _$Channel {
  const factory Channel({
    Links? links,
    required String code,
    @Default([]) List<String> currencies,
    @Default([]) List<String> locales,
    @JsonKey(name: 'category_tree') required String categoryTree,
    @Default({}) Map<String, dynamic> conversionUnits,
    @Default({}) Map<String, String?> labels,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required String code,
    String? parent,
    @Default({}) Map<String, String?> labels,
    Links? links,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Family with _$Family {
  const factory Family({
    Links? links,
    required String code,
    required List<String> attributes,
    @JsonKey(name: 'attribute_as_label') String? attributeAsLabel,
    @JsonKey(name: 'attribute_as_image') String? attributeAsImage,
    @JsonKey(name: 'attribute_requirements')
    @Default({})
    Map<String, List<String>> attributeRequirements,
    @Default({}) Map<String, String?> labels,
  }) = _Family;

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
}

@freezed
class FamilyVariant with _$FamilyVariant {
  const factory FamilyVariant({
    Links? links,
    required String code,
    @Default({}) Map<String, String?> labels,
    @JsonKey(name: 'variant_attribute_sets')
    required List<VariantAttributeSet> variantAttributeSets,
  }) = _FamilyVariant;

  factory FamilyVariant.fromJson(Map<String, dynamic> json) =>
      _$FamilyVariantFromJson(json);
}

@freezed
class VariantAttributeSet with _$VariantAttributeSet {
  const factory VariantAttributeSet({
    required int level,
    required List<String> axes,
    @Default([]) List<String> attributes,
  }) = _VariantAttributeSet;

  factory VariantAttributeSet.fromJson(Map<String, dynamic> json) =>
      _$VariantAttributeSetFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    Links? links,
    required String identifier,
    bool? enabled,
    String? family,
    @Default([]) List<String> categories,
    @Default([]) List<String> groups,
    String? parent,
    @Default({}) Map<String, List<Value>> values,
    String? created,
    String? updated,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    Links? links,
    required String code,
    @JsonKey(name: 'family_variant') required String familyVariant,
    String? parent,
    @Default([]) List<String> categories,
    @Default({}) Map<String, List<Value>> values,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

///
/// Response models
///

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    required int code,
    required String message,
    @JsonKey(name: '_links') Links? links,
    List<ApiError>? errors,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@freezed
class AkeneoPaginatedResponse with _$AkeneoPaginatedResponse {
  const factory AkeneoPaginatedResponse({
    @JsonKey(name: '_links') required Links links,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'items_count') int? itemCount,
    @JsonKey(name: '_embedded') required Embedded embedded,
  }) = _AkeneoPaginatedResponse;

  factory AkeneoPaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$AkeneoPaginatedResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    UrlReference? self,
    UrlReference? first,
    UrlReference? next,
    UrlReference? previous,
    UrlReference? documentation,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class UrlReference with _$UrlReference {
  const factory UrlReference({
    required String href,
  }) = _UrlReference;

  factory UrlReference.fromJson(Map<String, dynamic> json) =>
      _$UrlReferenceFromJson(json);
}

@freezed
class Embedded with _$Embedded {
  const factory Embedded({
    required List<dynamic> items,
  }) = _Embedded;

  factory Embedded.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedFromJson(json);
}

@freezed
class Value with _$Value {
  const factory Value({
    String? locale,
    String? scope,
    dynamic data,
  }) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@freezed
class ApiError with _$ApiError {
  factory ApiError({
    String? property,
    String? message,
    String? attribute,
    String? locale,
    String? scope,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
