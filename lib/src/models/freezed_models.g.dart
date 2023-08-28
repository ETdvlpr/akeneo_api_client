// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Attribute _$$_AttributeFromJson(Map<String, dynamic> json) => _$_Attribute(
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

Map<String, dynamic> _$$_AttributeToJson(_$_Attribute instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'group': instance.group,
      'unique': instance.unique,
      'useable_as_grid_filter': instance.useableAsGridFilter,
      'allowed_extensions': instance.allowedExtensions,
      'metric_family': instance.metricFamily,
      'default_metric_unit': instance.defaultMetricUnit,
      'reference_data_name': instance.referenceDataName,
      'available_locales': instance.availableLocales,
      'max_characters': instance.maxCharacters,
      'validation_rule': instance.validationRule,
      'validation_regexp': instance.validationRegexp,
      'wysiwyg_enabled': instance.wysiwygEnabled,
      'number_min': instance.numberMin,
      'number_max': instance.numberMax,
      'decimals_allowed': instance.decimalsAllowed,
      'negative_allowed': instance.negativeAllowed,
      'date_min': instance.dateMin,
      'date_max': instance.dateMax,
      'max_file_size': instance.maxFileSize,
      'minimum_input_length': instance.minimumInputLength,
      'sort_order': instance.sortOrder,
      'localizable': instance.localizable,
      'scopable': instance.scopable,
      'labels': instance.labels,
      'auto_option_sorting': instance.autoOptionSorting,
    };

_$_AttributeGroup _$$_AttributeGroupFromJson(Map<String, dynamic> json) =>
    _$_AttributeGroup(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      code: json['code'] as String,
      sortOrder: json['sort_order'] as int?,
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_AttributeGroupToJson(_$_AttributeGroup instance) =>
    <String, dynamic>{
      'links': instance.links,
      'code': instance.code,
      'sort_order': instance.sortOrder,
      'attributes': instance.attributes,
      'labels': instance.labels,
    };

_$_AttributeOption _$$_AttributeOptionFromJson(Map<String, dynamic> json) =>
    _$_AttributeOption(
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

Map<String, dynamic> _$$_AttributeOptionToJson(_$_AttributeOption instance) =>
    <String, dynamic>{
      'links': instance.links,
      'code': instance.code,
      'attribute': instance.attribute,
      'sort_order': instance.sortOrder,
      'labels': instance.labels,
    };

_$_Channel _$$_ChannelFromJson(Map<String, dynamic> json) => _$_Channel(
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
          json['conversionUnits'] as Map<String, dynamic>? ?? const {},
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_ChannelToJson(_$_Channel instance) =>
    <String, dynamic>{
      'links': instance.links,
      'code': instance.code,
      'currencies': instance.currencies,
      'locales': instance.locales,
      'category_tree': instance.categoryTree,
      'conversionUnits': instance.conversionUnits,
      'labels': instance.labels,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
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

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'code': instance.code,
      'parent': instance.parent,
      'labels': instance.labels,
      'links': instance.links,
    };

_$_Family _$$_FamilyFromJson(Map<String, dynamic> json) => _$_Family(
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

Map<String, dynamic> _$$_FamilyToJson(_$_Family instance) => <String, dynamic>{
      'links': instance.links,
      'code': instance.code,
      'attributes': instance.attributes,
      'attribute_as_label': instance.attributeAsLabel,
      'attribute_as_image': instance.attributeAsImage,
      'attribute_requirements': instance.attributeRequirements,
      'labels': instance.labels,
    };

_$_FamilyVariant _$$_FamilyVariantFromJson(Map<String, dynamic> json) =>
    _$_FamilyVariant(
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

Map<String, dynamic> _$$_FamilyVariantToJson(_$_FamilyVariant instance) =>
    <String, dynamic>{
      'links': instance.links,
      'code': instance.code,
      'labels': instance.labels,
      'variant_attribute_sets': instance.variantAttributeSets,
    };

_$_VariantAttributeSet _$$_VariantAttributeSetFromJson(
        Map<String, dynamic> json) =>
    _$_VariantAttributeSet(
      level: json['level'] as int,
      axes: (json['axes'] as List<dynamic>).map((e) => e as String).toList(),
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_VariantAttributeSetToJson(
        _$_VariantAttributeSet instance) =>
    <String, dynamic>{
      'level': instance.level,
      'axes': instance.axes,
      'attributes': instance.attributes,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
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

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'links': instance.links,
      'identifier': instance.identifier,
      'enabled': instance.enabled,
      'family': instance.family,
      'categories': instance.categories,
      'groups': instance.groups,
      'parent': instance.parent,
      'values': instance.values,
      'created': instance.created,
      'updated': instance.updated,
    };

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
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

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'links': instance.links,
      'code': instance.code,
      'family_variant': instance.familyVariant,
      'parent': instance.parent,
      'categories': instance.categories,
      'values': instance.values,
    };

_$_ErrorResponse _$$_ErrorResponseFromJson(Map<String, dynamic> json) =>
    _$_ErrorResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ApiError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ErrorResponseToJson(_$_ErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      '_links': instance.links,
      'errors': instance.errors,
    };

_$_AkeneoPaginatedResponse _$$_AkeneoPaginatedResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AkeneoPaginatedResponse(
      links: Links.fromJson(json['_links'] as Map<String, dynamic>),
      currentPage: json['current_page'] as int,
      itemCount: json['items_count'] as int?,
      embedded: Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AkeneoPaginatedResponseToJson(
        _$_AkeneoPaginatedResponse instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'current_page': instance.currentPage,
      'items_count': instance.itemCount,
      '_embedded': instance.embedded,
    };

_$_Links _$$_LinksFromJson(Map<String, dynamic> json) => _$_Links(
      self: json['self'] == null
          ? null
          : UrlReference.fromJson(json['self'] as Map<String, dynamic>),
      first: json['first'] == null
          ? null
          : UrlReference.fromJson(json['first'] as Map<String, dynamic>),
      next: json['next'] == null
          ? null
          : UrlReference.fromJson(json['next'] as Map<String, dynamic>),
      previous: json['previous'] == null
          ? null
          : UrlReference.fromJson(json['previous'] as Map<String, dynamic>),
      documentation: json['documentation'] == null
          ? null
          : UrlReference.fromJson(
              json['documentation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LinksToJson(_$_Links instance) => <String, dynamic>{
      'self': instance.self,
      'first': instance.first,
      'next': instance.next,
      'previous': instance.previous,
      'documentation': instance.documentation,
    };

_$_UrlReference _$$_UrlReferenceFromJson(Map<String, dynamic> json) =>
    _$_UrlReference(
      href: json['href'] as String,
    );

Map<String, dynamic> _$$_UrlReferenceToJson(_$_UrlReference instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

_$_Embedded _$$_EmbeddedFromJson(Map<String, dynamic> json) => _$_Embedded(
      items: json['items'] as List<dynamic>,
    );

Map<String, dynamic> _$$_EmbeddedToJson(_$_Embedded instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$_Value _$$_ValueFromJson(Map<String, dynamic> json) => _$_Value(
      locale: json['locale'] as String?,
      scope: json['scope'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$$_ValueToJson(_$_Value instance) => <String, dynamic>{
      'locale': instance.locale,
      'scope': instance.scope,
      'data': instance.data,
    };

_$_ApiError _$$_ApiErrorFromJson(Map<String, dynamic> json) => _$_ApiError(
      property: json['property'] as String?,
      message: json['message'] as String?,
      attribute: json['attribute'] as String?,
      locale: json['locale'] as String?,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$$_ApiErrorToJson(_$_ApiError instance) =>
    <String, dynamic>{
      'property': instance.property,
      'message': instance.message,
      'attribute': instance.attribute,
      'locale': instance.locale,
      'scope': instance.scope,
    };
