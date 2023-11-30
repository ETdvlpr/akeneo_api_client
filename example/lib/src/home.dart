import 'package:akeneo_api_client/akeneo_api_client.dart';
import 'package:example/src/product_list.dart';
import 'package:example/src/routes.dart';
import 'package:flutter/material.dart';

/// The main screen of the application.
class Home extends StatefulWidget {
  final AkeneoApiClient apiClient;
  final List<String> selectedAttributes;

  /// Creates a [Home] widget.
  ///
  /// The [apiClient] parameter is an instance of [AkeneoApiClient] for making API calls.
  /// The [selectedAttributes] parameter is a list of attribute codes to display.
  const Home({
    Key? key,
    required this.apiClient,
    required this.selectedAttributes,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> selectedAttributes = [];

  @override
  void initState() {
    selectedAttributes = widget.selectedAttributes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akeneo Products List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              // Open the select attributes screen and wait for the result
              final attributes = await Navigator.pushNamed(
                context,
                Routes.selectAttributes,
                arguments: selectedAttributes,
              );

              // Update selectedAttributes if the user made a selection
              if (attributes != null) {
                setState(() => selectedAttributes = attributes as List<String>);
              }
            },
          ),
        ],
      ),
      body: ProductsList(
        apiClient: widget.apiClient,
        selectedAttributes: selectedAttributes,
      ),
    );
  }
}
