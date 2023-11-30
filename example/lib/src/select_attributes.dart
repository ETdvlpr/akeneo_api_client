import 'package:flutter/material.dart';
import 'package:akeneo_api_client/akeneo_api_client.dart';

/// A widget for selecting displayed attributes.
class SelectAttributes extends StatefulWidget {
  final List<String> selectedAttributes;
  final AkeneoApiClient apiClient;

  /// Creates a [SelectAttributes] widget.
  ///
  /// The [selectedAttributes] parameter is a list of initially selected attribute codes.
  /// The [apiClient] parameter is an instance of [AkeneoApiClient] for making API calls.
  const SelectAttributes({
    Key? key,
    required this.apiClient,
    required this.selectedAttributes,
  }) : super(key: key);

  @override
  SelectAttributesState createState() => SelectAttributesState();
}

/// The state for the [SelectAttributes] widget.
class SelectAttributesState extends State<SelectAttributes> {
  int currentPage = 1;
  bool isLoading = false;
  bool isLoadingMore = false;
  List<Attribute> loadedAttributes = [];
  final ScrollController _scrollController = ScrollController();
  List<String> selectedAttributes = [];
  final List<String> initialAttributes = [
    "Family",
    "Categories",
    "Groups",
    "Enabled",
    "Parent",
    "Created",
    "Updated"
  ];

  @override
  void initState() {
    super.initState();
    selectedAttributes = widget.selectedAttributes;
    _scrollController.addListener(_scrollListener);
    _loadAttributes();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      if (!isLoading && !isLoadingMore) {
        currentPage++;
        _loadAttributes(loadMore: true);
      }
    }
  }

  Future<void> _loadAttributes({bool loadMore = false}) async {
    setState(() {
      isLoadingMore = loadMore;
      isLoading = !loadMore;
    });

    try {
      final response = await widget.apiClient.getAttributes(
        params: QueryParameter(
          page: currentPage,
          limit: 50,
        ),
      );
      final newAttributes = response.embedded.items as List<Attribute>;

      setState(() {
        if (loadMore) {
          loadedAttributes.addAll(newAttributes);
        } else {
          loadedAttributes = newAttributes;
        }
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        isLoadingMore = false;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return isLoadingMore
        ? const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          )
        : Container();
  }

  Widget _buildAttributeCheckbox(Attribute attribute) {
    final attributeCode = attribute.code;
    final attributeLabel = attribute.labels['en_US'] ?? attributeCode;

    return CheckboxListTile(
      title: Text(attributeLabel),
      value: selectedAttributes.contains(attributeCode),
      onChanged: (bool? value) {
        _handleAttributeSelection(attributeCode, value ?? false);
      },
    );
  }

  Widget _buildInitialAttributeCheckbox(String attributeCode) {
    return CheckboxListTile(
      title: Text(attributeCode),
      value: selectedAttributes.contains(attributeCode),
      onChanged: (bool? value) {
        _handleAttributeSelection(attributeCode, value ?? false);
      },
    );
  }

  void _handleAttributeSelection(String attributeCode, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedAttributes.add(attributeCode);
      } else {
        selectedAttributes.remove(attributeCode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select displayed attributes")),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, selectedAttributes);
          return true;
        },
        child: _buildAttributeListView(),
      ),
    );
  }

  Widget _buildAttributeListView() {
    final itemCount = loadedAttributes.length + initialAttributes.length + 1;
    final hasMorePages = currentPage < loadedAttributes.length;

    return ListView.builder(
      controller: _scrollController,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index < initialAttributes.length) {
          return _buildInitialAttributeCheckbox(initialAttributes[index]);
        } else if (index < initialAttributes.length + loadedAttributes.length) {
          return _buildAttributeCheckbox(
              loadedAttributes[index - initialAttributes.length]);
        } else if (hasMorePages) {
          return _buildProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
