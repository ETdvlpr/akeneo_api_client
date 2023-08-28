/// Enumeration of attribute types used in Akeneo.
enum AttributeType {
  identifier,
  text,
  textArea,
  boolean,
  number,
  simpleSelect,
  multiSelect,
  date,
  metric,
  price,
  image,
  file,
}

/// Extension for the `AttributeType` enum providing a string representation for JSON serialization.
extension AttributeTypeValue on AttributeType {
  /// Returns the string value corresponding to the enum value for JSON serialization.
  String get value {
    switch (this) {
      case AttributeType.identifier:
        return 'pim_catalog_identifier';
      case AttributeType.text:
        return 'pim_catalog_text';
      case AttributeType.textArea:
        return 'pim_catalog_textarea';
      case AttributeType.boolean:
        return 'pim_catalog_boolean';
      case AttributeType.number:
        return 'pim_catalog_number';
      case AttributeType.simpleSelect:
        return 'pim_catalog_simpleselect';
      case AttributeType.multiSelect:
        return 'pim_catalog_multiselect';
      case AttributeType.date:
        return 'pim_catalog_date';
      case AttributeType.metric:
        return 'pim_catalog_metric';
      case AttributeType.price:
        return 'pim_catalog_price_collection';
      case AttributeType.image:
        return 'pim_catalog_image';
      case AttributeType.file:
        return 'pim_catalog_file';
    }
  }
}
