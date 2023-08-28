# Akeneo API Client for Flutter

A Flutter library for consuming Akeneo PIM's RESTful API. This library provides a convenient way to interact with the Akeneo API to manage attributes, attribute options, families, categories, and products.

## Features

- Authenticate with the Akeneo API using OAuth2 credentials.
- Handle token refreshing automatically for extended sessions.
- Convenient methods for creating, retrieving, updating, and deleting various entities.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  akeneo_api_client: ^1.0.0
```

## Usage

### Importing

```dart
import 'package:akeneo_api_client/akeneo_api_client.dart';
```

### Initializing the Client

```dart
var apiClient = AkeneoApiClient(
  endpoint: Uri.parse("http://localhost:8080"),
  clientId: "your-client-id",
  clientSecret: "your-client-secret",
  userName: "your-username",
  password: "your-password",
);
```

### CRUD Operations

```dart
// Create an attribute
var attribute = Attribute(
        code: 'test_attr',
        type: AttributeType.text.value,
        group: 'test_group',
      );
await apiClient.createAttribute(attribute);

// Get an attribute
var attributeCode = 'color';
var retrievedAttribute = await apiClient.getAttribute(attributeCode);

// Update an attribute
var updatedAttribute = retrievedAttribute.copyWith(labels: {
        'en_US': 'Color',
      });
await apiClient.updateAttribute(updatedAttribute);
```

### Handling Other Entities

Likewise, you can utilize the `createEntity`, `getEntity`, and `updateEntity` methods for various aspects such as attribute options, families, categories, and products. Just replace "entity" with the specific name of the element you are working with.

## Contributing

Contributions are welcome! If you encounter bugs or have suggestions for improvements, please open an issue or create a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
