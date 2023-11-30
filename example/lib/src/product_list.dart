import 'package:akeneo_api_client/akeneo_api_client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// A widget for displaying a list of products.
class ProductsList extends StatelessWidget {
  final AkeneoApiClient apiClient;
  final List<String> selectedAttributes;

  /// Creates a [ProductsList] widget.
  ///
  /// The [apiClient] parameter is an instance of [AkeneoApiClient] for making API calls.
  /// The [selectedAttributes] parameter is a list of attribute codes to display.
  const ProductsList({
    required this.apiClient,
    required this.selectedAttributes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AkeneoPaginatedResponse>(
      future: apiClient.getProducts(
        params: QueryParameter(
          limit: 30,
        ),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          final errorMessage = snapshot.error is ApiException
              ? (snapshot.error as ApiException).message
              : 'An error occurred';
          return Center(child: Text('Error: $errorMessage'));
        } else if (snapshot.hasData) {
          final products = snapshot.data!.embedded.items;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final itemProduct = products[index];
              final product = Product.fromJson(itemProduct);
              final attributeWidgets = _buildAttributeWidgets(product);

              return Card(
                color: Colors.yellow[50],
                margin: const EdgeInsets.all(10.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: Text(product.identifier),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      ..._buildProductInfoWidgets(product),
                      ...attributeWidgets,
                    ],
                  ),
                  onTap: () {
                    _showAttributeModal(context, product);
                  },
                ),
              );
            },
          );
        } else {
          return const Text('No products available.');
        }
      },
    );
  }

  List<Widget> _buildProductInfoWidgets(Product product) {
    return [
      if (selectedAttributes.contains('Family'))
        ..._buildInfoEntry('Family', product.family ?? 'N/A'),
      if (selectedAttributes.contains('Categories'))
        ..._buildInfoEntry('Categories', product.categories.join(', ')),
      if (selectedAttributes.contains('Enabled'))
        ..._buildInfoEntry('Enabled', product.enabled ?? false),
      if (selectedAttributes.contains('Groups'))
        ..._buildInfoEntry('Groups', product.groups.join(', ')),
      if (selectedAttributes.contains('Parent'))
        ..._buildInfoEntry('Parent', product.parent ?? 'N/A'),
      if (selectedAttributes.contains('Created'))
        ..._buildInfoEntry('Created', product.created ?? 'N/A'),
      if (selectedAttributes.contains('Updated'))
        ..._buildInfoEntry('Updated', product.updated ?? 'N/A'),
    ];
  }

  List<Widget> _buildAttributeWidgets(
    Product product, {
    bool showAll = false,
  }) {
    return product.values.entries.map((entry) {
      if (showAll == false && !selectedAttributes.contains(entry.key)) {
        return Container();
      }
      final attributeCode = entry.key;

      return FutureBuilder<Map<Attribute, List<Value>>>(
        future: getAttributeAndValues(attributeCode, entry.value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            final errorMessage = snapshot.error is ApiException
                ? (snapshot.error as ApiException).message
                : 'An error occurred';
            return Center(child: Text('Error: $errorMessage'));
          } else if (snapshot.hasData) {
            final attribute = snapshot.data!.keys.first;
            final attributeValues = snapshot.data!.values.first;
            if (attribute.type != AttributeType.image.value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '${attribute.labels['en_US'] ?? attribute.code}:',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: attributeValues.map((value) {
                      return Text(value.data.toString());
                    }).toList(),
                  ),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '${attribute.labels['en_US'] ?? attribute.code}:',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: attributeValues.map((value) {
                      if (value.data == null) {
                        return Container();
                      }
                      final url =
                          apiClient.getMediaFileUrl(value.data.toString());
                      final headers = {'Authorization': apiClient.bearerToken};
                      return FutureBuilder<http.Response>(
                        future: http.get(
                          Uri.parse(url),
                          headers: headers,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                                'Error loading image: ${snapshot.error}');
                          } else {
                            return Image.memory(
                              snapshot.data!.bodyBytes,
                              fit: BoxFit.contain,
                            );
                          }
                        },
                      );
                    }).toList(),
                  ),
                ],
              );
            }
          } else {
            return const Text('No data available.');
          }
        },
      );
    }).toList();
  }

  List<Widget> _buildInfoEntry(String label, dynamic value) {
    return [
      Text('$label: $value'),
      const Divider(),
    ];
  }

  /// Displays an AlertDialog showing all attributes for the selected product.
  void _showAttributeModal(BuildContext context, Product productDisplay) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Product Attributes'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildAttributeWidgets(productDisplay, showAll: true),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<Map<Attribute, List<Value>>> getAttributeAndValues(
      String attributeCode, List<Value> values) async {
    final attribute = await apiClient.getAttribute(attributeCode);

    if (![AttributeType.simpleSelect.value, AttributeType.multiSelect.value]
        .contains(attribute.type)) {
      return {attribute: values};
    }

    final attributeValues = await Future.wait(
        values.where((value) => value.data != null).map((value) async {
      final option = await apiClient.getAttributeOption(
        attributeCode,
        value.data.toString(),
      );
      return Value(
        data: option.labels['en_US'] ?? option.code,
        locale: value.locale,
        scope: value.scope,
      );
    }));

    return {attribute: attributeValues};
  }
}
