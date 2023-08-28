import 'package:json_annotation/json_annotation.dart';

/// Enumeration of operators used in Akeneo search filters.
enum AkeneoOperator {
  @JsonValue('STARTS WITH')
  startsWith,
  @JsonValue('CONTAINS')
  contains,
  @JsonValue('DOES NOT CONTAIN')
  doesNotContain,
  @JsonValue('=')
  equal,
  @JsonValue('!=')
  notEqual,
  @JsonValue('EMPTY')
  empty,
  @JsonValue('NOT EMPTY')
  notEmpty,
  @JsonValue('IN')
  inValue,
  @JsonValue('NOT IN')
  notIn,
  @JsonValue('<')
  lessThan,
  @JsonValue('<=')
  lessThanOrEqual,
  @JsonValue('>')
  greaterThan,
  @JsonValue('>=')
  greaterThanOrEqual,
  @JsonValue('BETWEEN')
  dateBetween,
  @JsonValue('NOT BETWEEN')
  dateNotBetween,
}

/// Extension for the `AkeneoOperator` enum providing a string representation for JSON serialization.
extension AkeneoOperatorValue on AkeneoOperator {
  /// Returns the string value corresponding to the enum value for JSON serialization.
  String get value {
    switch (this) {
      case AkeneoOperator.startsWith:
        return 'STARTS WITH';
      case AkeneoOperator.contains:
        return 'CONTAINS';
      case AkeneoOperator.doesNotContain:
        return 'DOES NOT CONTAIN';
      case AkeneoOperator.equal:
        return '=';
      case AkeneoOperator.notEqual:
        return '!=';
      case AkeneoOperator.empty:
        return 'EMPTY';
      case AkeneoOperator.notEmpty:
        return 'NOT EMPTY';
      case AkeneoOperator.inValue:
        return 'IN';
      case AkeneoOperator.notIn:
        return 'NOT IN';
      case AkeneoOperator.lessThan:
        return '<';
      case AkeneoOperator.lessThanOrEqual:
        return '<=';
      case AkeneoOperator.greaterThan:
        return '>';
      case AkeneoOperator.greaterThanOrEqual:
        return '>=';
      case AkeneoOperator.dateBetween:
        return 'BETWEEN';
      case AkeneoOperator.dateNotBetween:
        return 'NOT BETWEEN';
    }
  }
}
