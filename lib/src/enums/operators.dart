import 'package:json_annotation/json_annotation.dart';

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
  @JsonValue('=')
  dateEqual,
  @JsonValue('!=')
  dateNotEqual,
  @JsonValue('<')
  dateLessThan,
  @JsonValue('>')
  dateGreaterThan,
  @JsonValue('BETWEEN')
  dateBetween,
  @JsonValue('NOT BETWEEN')
  dateNotBetween,
}

extension AkeneoOperatorValue on AkeneoOperator {
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
      case AkeneoOperator.dateEqual:
        return '=';
      case AkeneoOperator.dateNotEqual:
        return '!=';
      case AkeneoOperator.dateLessThan:
        return '<';
      case AkeneoOperator.dateGreaterThan:
        return '>';
      case AkeneoOperator.dateBetween:
        return 'BETWEEN';
      case AkeneoOperator.dateNotBetween:
        return 'NOT BETWEEN';
    }
  }
}
