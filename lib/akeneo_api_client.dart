/// Akeneo API Client library for interacting with the Akeneo PIM REST API.
///
/// This library provides classes and utilities for making API requests and
/// handling responses using the Akeneo PIM API.
///
/// Example usage:
/// ```dart
/// import 'package:akeneo_api_client/akeneo_api_client.dart';
///
/// void main() async {
///  final client = AkeneoClient(
///                  endpoint: Uri.parse('https://akeneo-endpoint.com'),
///                  clientId: 'client-id',
///                  clientSecret: 'client-secret',
///                  userName: 'username',
///                  password: 'password',
///               );
///
///   final products = await client.getProducts();
///   print(products);
/// }
/// ```
///
/// For more information, see the [Akeneo PIM API documentation](https://api.akeneo.com/api-reference-index.html).
library akeneo_api_client;

export 'src/akeneo_api_client_base.dart';
export 'src/enums/attribute_type.dart';
export 'src/enums/operators.dart';
export 'src/exceptions/api_exception.dart';
export 'src/models/freezed_models.dart';
export 'src/models/query_parameters.dart';
