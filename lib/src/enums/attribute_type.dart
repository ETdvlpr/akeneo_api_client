enum AttributeType {
  Identifier,
  Text,
  TextArea,
  Boolean,
  Number,
  SimpleSelect,
  MultiSelect,
  Date,
  Metric,
  Price,
  Image,
  File,
}

extension AttributeTypeValue on AttributeType {
  String get value {
    switch (this) {
      case AttributeType.Identifier:
        return 'pim_catalog_identifier';
      case AttributeType.Text:
        return 'pim_catalog_text';
      case AttributeType.TextArea:
        return 'pim_catalog_textarea';
      case AttributeType.Boolean:
        return 'pim_catalog_boolean';
      case AttributeType.Number:
        return 'pim_catalog_number';
      case AttributeType.SimpleSelect:
        return 'pim_catalog_simpleselect';
      case AttributeType.MultiSelect:
        return 'pim_catalog_multiselect';
      case AttributeType.Date:
        return 'pim_catalog_date';
      case AttributeType.Metric:
        return 'pim_catalog_metric';
      case AttributeType.Price:
        return 'pim_catalog_price_collection';
      case AttributeType.Image:
        return 'pim_catalog_image';
      case AttributeType.File:
        return 'pim_catalog_file';
    }
  }
}
