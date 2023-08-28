import 'dart:convert';

import 'package:akeneo_api_client/src/enums/operators.dart';

class SearchFilter {
  final String field;
  final AkeneoOperator operator;
  final dynamic value;
  final String? locale;
  final String? scope;

  SearchFilter({
    required this.field,
    required this.operator,
    required this.value,
    this.locale,
    this.scope,
  });

  Map<String, dynamic> toJson() {
    dynamic jsonValue = value;
    if (value is List) {
      jsonValue = value.map((e) => e.toString()).toList();
    }

    final Map<String, dynamic> json = {
      'operator': operator.value,
      'value': jsonValue,
      if (locale != null) 'locale': locale,
      if (scope != null) 'scope': scope,
    };

    return {
      field: [json],
    };
  }
}

class QueryParameter {
  final List<SearchFilter>? filters;
  final int? limit;
  final int? page;
  final bool? withCount;
  final String? paginationType;
  final bool? withQualityScores;
  final String? searchAfter;
  final bool? withAttributeOptions;
  final bool? withCompletenesses;

  QueryParameter({
    this.filters,
    this.limit,
    this.page,
    this.withCount,
    this.paginationType,
    this.withQualityScores,
    this.searchAfter,
    this.withAttributeOptions,
    this.withCompletenesses,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      if (filters != null) 'search': combineFilters(filters!),
      if (limit != null) 'limit': "$limit",
      if (page != null) 'page': "$page",
      if (withCount != null) 'with_count': "$withCount",
      if (paginationType != null) 'pagination_type': "$paginationType",
      if (withQualityScores != null)
        'with_quality_scores': "$withQualityScores",
      if (searchAfter != null) 'search_after': "$searchAfter",
      if (withAttributeOptions != null)
        'with_attribute_options': "$withAttributeOptions",
      if (withCompletenesses != null)
        'with_completenesses': "$withCompletenesses",
    };
    return json;
  }

  String combineFilters(List<SearchFilter> list) {
    final Map<String, dynamic> json = {};

    for (final parameter in list) {
      final String field = parameter.field;
      final AkeneoOperator operator = parameter.operator;
      final dynamic value = parameter.value;

      final Map<String, dynamic> parameterJson = {
        'operator': operator.value,
        'value': value,
        if (parameter.locale != null) 'locale': parameter.locale,
        if (parameter.scope != null) 'scope': parameter.scope,
      };

      json.putIfAbsent(field, () => []).add(parameterJson);
    }

    return jsonEncode(json);
  }
}
