import 'dart:convert';

import 'package:akeneo_api_client/src/enums/operators.dart';

/// Represents a search filter used in querying Akeneo data.
class SearchFilter {
  /// The field to filter on.
  final String field;

  /// The operator to apply in the filter.
  final AkeneoOperator operator;

  /// The value to compare with.
  final dynamic value;

  /// The locale for filtering.
  final String? locale;

  /// The scope for filtering.
  final String? scope;

  SearchFilter({
    required this.field,
    required this.operator,
    required this.value,
    this.locale,
    this.scope,
  });

  /// Converts the filter to a JSON representation.
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

/// Represents query parameters for customizing data retrieval from Akeneo.
class QueryParameter {
  /// The list of search filters.
  final List<SearchFilter>? filters;

  /// The maximum number of items to retrieve.
  final int? limit;

  /// The page number for pagination.
  final int? page;

  /// Indicates whether to include the item count.
  final bool? withCount;

  /// The type of pagination.
  final String? paginationType;

  /// Indicates whether to include quality scores.
  final bool? withQualityScores;

  /// The search position for pagination.
  final String? searchAfter;

  /// Indicates whether to include attribute options.
  final bool? withAttributeOptions;

  /// Indicates whether to include completeness information.
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

  /// Converts the query parameters to a JSON representation.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      if (filters != null) 'search': _combineFilters(filters!),
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

  /// Combines multiple search filters into a single JSON representation.
  String _combineFilters(List<SearchFilter> list) {
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
