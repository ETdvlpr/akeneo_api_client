import 'dart:convert';

import 'package:akeneo_api_client/akeneo_api_client.dart';
import 'package:akeneo_api_client/src/exceptions/network_exceptions.dart';
import 'package:http/http.dart' as http;

import 'http_wrapper.dart';

/// A Dart client for interacting with the Akeneo API.
///
/// This library provides convenient methods for performing various operations
/// on the Akeneo API, such as creating, fetching, and updating attributes.
class AkeneoApiClient {
  /// The HTTP wrapper used for making API requests.
  final HttpWrapper _httpWrapper;

  /// Determines whether attributes are cached locally.
  final bool cacheAttributes;

  /// A map of attribute codes to Attribute instances.
  final Map<String, Attribute> _attributes = {};

  /// A map of attribute codes to AttributeOption instances.
  final Map<String, AttributeOption> _attributeOptions = {};

  /// debug mode
  final bool debug;

  /// Creates an instance of [AkeneoApiClient] with the provided credentials
  ///
  /// The [endpoint], [clientId], [clientSecret], [userName], and [password]
  /// are required for authenticating with the Akeneo API.
  ///
  /// If [cacheAttributes] is set to true, fetched attributes will be cached
  /// locally to reduce redundant API calls.
  /// Example usage :
  /// ```dart
  ///    var apiClient = AkeneoApiClient(
  ///      endpoint: Uri.parse("http://localhost:8080"),
  ///      clientId: "your-client-id",
  ///      clientSecret: "your-client-secret",
  ///      userName: "your-username",
  ///      password: "your-password",
  ///    );
  /// ```
  AkeneoApiClient({
    required Uri endpoint,
    required String clientId,
    required String clientSecret,
    required String userName,
    required String password,
    this.cacheAttributes = true,
    this.debug = false,
  }) : _httpWrapper = HttpWrapper(
          endpoint: endpoint,
          clientId: clientId,
          clientSecret: clientSecret,
          userName: userName,
          password: password,
          debug: debug,
        );

  /// Returns Bearer token for authentication
  String get bearerToken {
    return 'Bearer ${_httpWrapper.accessToken}';
  }

  /// Creates an [ApiException] instance from the given [responseBody].
  ApiException _createApiExceptionFromResponse(String responseBody) {
    final Map<String, dynamic> json = jsonDecode(responseBody);
    final errorResponse = ErrorResponse.fromJson(json);
    return ApiException(errorResponse.message, errorResponse: errorResponse);
  }

  /// Makes an API request and handles exceptions.
  Future<T> _handleApiRequest<T>(
    Future<http.Response> Function() request,
    T Function(Map<String, dynamic> json) dataMapper,
  ) async {
    try {
      final response = await request();
      if (response.statusCode ~/ 100 == 2) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return dataMapper(json);
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } on NetworkExceptions catch (e) {
      throw ApiException(NetworkExceptions.getErrorMessage(e));
    } catch (e) {
      throw ApiException('An error occurred: $e');
    }
  }

  /// Creates a new attribute on the Akeneo API.
  ///
  /// The [attribute] parameter represents the attribute to be created.
  Future<http.Response> createAttribute(Attribute attribute) async {
    return _handleApiRequest(() async {
      final attributeData = attribute.toJson();
      return await _httpWrapper.post('api/rest/v1/attributes', attributeData);
    }, (json) => http.Response(json.toString(), 200));
  }

  /// Retrieves an attribute from the Akeneo API by its [attributeCode].
  ///
  /// If [cacheAttributes] is enabled and the attribute is already cached,
  /// the cached attribute will be returned.
  Future<Attribute> getAttribute(String attributeCode) async {
    if (cacheAttributes && _attributes.containsKey(attributeCode)) {
      return _attributes[attributeCode]!;
    }

    return _handleApiRequest<Attribute>(
      () async {
        return await _httpWrapper.get('api/rest/v1/attributes/$attributeCode');
      },
      (json) {
        final attribute = Attribute.fromJson(json);
        if (cacheAttributes) {
          _attributes[attributeCode] = attribute;
        }
        return attribute;
      },
    );
  }

  /// Retrieves attributes from an Akeneo API endpoint with optional filtering and pagination.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing the retrieved attributes.
  ///
  /// [params]: An instance of [QueryParameter] that holds query parameters for filtering and pagination.
  ///
  /// Throws an [ApiException] if an error occurs during the API request.
  ///  Example usage:
  /// ```dart
  ///   final queryParameters = QueryParameter(
  ///     filters: [
  ///       SearchFilter(
  ///         field: 'code',
  ///         operator: AkeneoOperator.IN,
  ///         value: ['code1', 'code2'],
  ///       ),
  ///     ],
  ///   );
  ///   var attributeResponse = await apiClient.getAttributes(params: queryParameters);
  /// ```
  Future<AkeneoPaginatedResponse> getAttributes({
    QueryParameter? params,
  }) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/attributes',
          queryParameters: params?.toJson(),
        );
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing attribute on the Akeneo API.
  ///
  /// The [updatedAttribute] parameter contains the updated attribute data.
  Future<http.Response> updateAttribute(Attribute updatedAttribute) async {
    return _handleApiRequest(() async {
      final updatedAttributeData = updatedAttribute.toJson();
      final attributeCode = updatedAttribute.code;

      updatedAttributeData.remove('code');
      updatedAttributeData.remove('type');
      updatedAttributeData.remove('scopable');
      updatedAttributeData.remove('localizable');
      updatedAttributeData.remove('unique');

      return await _httpWrapper.patch(
        'api/rest/v1/attributes/$attributeCode',
        updatedAttributeData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new attribute group.
  ///
  /// This method sends a POST request to the Akeneo API to create a new attribute group.
  /// The [attributeGroup] parameter should be an instance of [AttributeGroup] containing
  /// the details of the attribute group to be created.
  /// Returns a [http.Response] containing the API response.
  ///
  /// Throws an [ApiException] if an error occurs during the API request.
  Future<http.Response> createAttributeGroup(
      AttributeGroup attributeGroup) async {
    return _handleApiRequest(() async {
      final attributeGroupData = attributeGroup.toJson();
      return await _httpWrapper.post(
          'api/rest/v1/attribute-groups', attributeGroupData);
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retrieves an attribute group by its code.
  ///
  /// This method sends a GET request to the Akeneo API to retrieve an attribute group
  /// based on the provided [attributeGroupCode].
  /// Returns an instance of [AttributeGroup] containing the retrieved attribute group data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request.
  Future<AttributeGroup> getAttributeGroup(String attributeGroupCode) async {
    return _handleApiRequest<AttributeGroup>(
      () async {
        return await _httpWrapper
            .get('api/rest/v1/attribute-groups/$attributeGroupCode');
      },
      (json) => AttributeGroup.fromJson(json),
    );
  }

  /// Retrieves a paginated list of attribute groups.
  ///
  /// This method sends a GET request to the Akeneo API to retrieve a list of attribute groups.
  /// The optional [params] parameter can be used to include query parameters in the API request.
  /// Returns an instance of [AkeneoPaginatedResponse] containing the paginated response data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request.
  Future<AkeneoPaginatedResponse> getAttributeGroups({
    QueryParameter? params,
  }) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/attribute-groups',
          queryParameters: params?.toJson(),
        );
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing attribute group.
  ///
  /// This method sends a PATCH request to the Akeneo API to update an attribute group.
  /// The [updatedAttributeGroup] parameter should be an instance of [AttributeGroup]
  /// containing the updated attribute group data.
  ///
  /// Returns a [http.Response] with status code 204 if successful
  Future<http.Response> updateAttributeGroup(
      AttributeGroup updatedAttributeGroup) async {
    return _handleApiRequest(() async {
      final updatedAttributeGroupData = updatedAttributeGroup.toJson();
      final attributeGroupCode = updatedAttributeGroup.code;
      updatedAttributeGroupData.remove('code');

      return await _httpWrapper.patch(
        'api/rest/v1/attribute-groups/$attributeGroupCode',
        updatedAttributeGroupData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new attribute option.
  ///
  /// Takes an [AttributeOption] object as input and sends a POST request to the
  /// Akeneo API to create the attribute option.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createAttributeOption(
      AttributeOption attributeOption) async {
    return _handleApiRequest(() async {
      final attributeOptionData = attributeOption.toJson();
      return await _httpWrapper.post(
        'api/rest/v1/attributes/${attributeOption.attribute}/options',
        attributeOptionData,
      );
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retrieves an attribute option by its attribute code and option code.
  ///
  /// Takes an [attributeCode] and [attributeOptionCode] as input and sends a GET
  /// request to the Akeneo API to fetch the attribute option.
  ///
  /// If [cacheAttributes] is enabled and the attribute option is cached, it returns
  /// the cached option. Otherwise, it fetches the option from the API, optionally
  /// caches it, and returns it.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<AttributeOption> getAttributeOption(
      String attributeCode, String attributeOptionCode) async {
    final cacheKey = '$attributeCode:$attributeOptionCode';

    if (cacheAttributes && _attributeOptions.containsKey(cacheKey)) {
      return _attributeOptions[cacheKey]!;
    }

    return _handleApiRequest<AttributeOption>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/attributes/$attributeCode/options/$attributeOptionCode',
        );
      },
      (json) {
        final attributeOption = AttributeOption.fromJson(json);
        if (cacheAttributes) {
          _attributeOptions[cacheKey] = attributeOption;
        }
        return attributeOption;
      },
    );
  }

  /// Retrieves a paginated list of attribute options for a given attribute.
  ///
  /// Takes an [attributeCode] as input and sends a GET request to the Akeneo API
  /// to fetch a paginated list of attribute options associated with the specified attribute.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing the paginated list of attribute options.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<AkeneoPaginatedResponse> getAttributeOptions(
      String attributeCode) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/attributes/$attributeCode/options',
        );
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing attribute option.
  ///
  /// Takes an [updatedAttributeOption] as input and sends a PATCH request to the Akeneo API
  /// to update the specified attribute option with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateAttributeOption(
      AttributeOption updatedAttributeOption) async {
    return _handleApiRequest(() async {
      final updatedAttributeOptionData = updatedAttributeOption.toJson();
      final attributeOptionCode = updatedAttributeOption.code;
      updatedAttributeOptionData.remove('code');

      return await _httpWrapper.patch(
        'api/rest/v1/attributes/${updatedAttributeOption.attribute}/options/$attributeOptionCode',
        updatedAttributeOptionData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new family.
  ///
  /// Takes a [family] object as input and sends a POST request to the Akeneo API
  /// to create a new family with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createFamily(Family family) async {
    return _handleApiRequest(() async {
      final familyData = family.toJson();
      return await _httpWrapper.post('api/rest/v1/families', familyData);
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retrieves a family by its family code.
  ///
  /// Takes a [familyCode] as input and sends a GET request to the Akeneo API
  /// to fetch the family associated with the specified family code.
  ///
  /// Returns a [Family] object representing the fetched family.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<Family> getFamily(String familyCode) async {
    return _handleApiRequest<Family>(
      () async {
        return await _httpWrapper.get('api/rest/v1/families/$familyCode');
      },
      (json) => Family.fromJson(json),
    );
  }

  /// Retrieves a paginated list of families.
  ///
  /// Takes an optional [params] parameter of type [QueryParameter] that allows you to customize
  /// the query parameters for the API request.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing the paginated list of families.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  ///
  ///  Example usage:
  /// ```dart
  ///   final queryParameters = QueryParameter(
  ///     filters: [
  ///       SearchFilter(
  ///         field: 'updated',
  ///         operator: AkeneoOperator.greaterThan,
  ///         value: DateTime(2023, 8, 28, 10, 0, 0).toIso8601String(),
  ///       ),
  ///     ],
  ///   );
  ///   var familyResponse = await apiClient.getFamilies(params: queryParameters);
  /// ```
  Future<AkeneoPaginatedResponse> getFamilies({
    QueryParameter? params,
  }) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/families',
          queryParameters: params?.toJson(),
        );
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing family.
  ///
  /// Takes an [updatedFamily] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified family with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateFamily(Family updatedFamily) async {
    return _handleApiRequest(() async {
      final updatedFamilyData = updatedFamily.toJson();
      final familyCode = updatedFamily.code;
      updatedFamilyData.remove('code');

      return await _httpWrapper.patch(
        'api/rest/v1/families/$familyCode',
        updatedFamilyData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new family variant.
  ///
  /// Takes a [family] code and a [familyVariant] object as input and sends a POST request
  /// to the Akeneo API to create a new family variant associated with the specified family.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createFamilyVariant(
      String family, FamilyVariant familyVariant) async {
    return _handleApiRequest(() async {
      final familyVariantData = familyVariant.toJson();
      return await _httpWrapper.post(
        'api/rest/v1/families/$family/variants',
        familyVariantData,
      );
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retrieves a family variant by its family code and variant code.
  ///
  /// Takes a [family] code and a [familyVariantCode] as input and sends a GET request
  /// to the Akeneo API to fetch the family variant associated with the specified family and variant codes.
  ///
  /// Returns a [FamilyVariant] object representing the fetched family variant.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<FamilyVariant> getFamilyVariant(
      String family, String familyVariantCode) async {
    return _handleApiRequest<FamilyVariant>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/families/$family/variants/$familyVariantCode',
        );
      },
      (json) => FamilyVariant.fromJson(json),
    );
  }

  /// Retrieves a paginated list of family variants for a given family.
  ///
  /// Takes a [family] code as input and sends a GET request to the Akeneo API
  /// to fetch a paginated list of family variants associated with the specified family.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing the paginated list of family variants.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<AkeneoPaginatedResponse> getFamilyVariants(String family) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get('api/rest/v1/families/$family/variants');
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing family variant.
  ///
  /// Takes a [family] code and an [updatedFamilyVariant] object as input and sends
  /// a PATCH request to the Akeneo API to update the specified family variant with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateFamilyVariant(
      String family, FamilyVariant updatedFamilyVariant) async {
    return _handleApiRequest(() async {
      final updatedFamilyVariantData = updatedFamilyVariant.toJson();
      final familyVariantCode = updatedFamilyVariant.code;
      updatedFamilyVariantData.remove('code');

      return await _httpWrapper.patch(
        'api/rest/v1/families/$family/variants/$familyVariantCode',
        updatedFamilyVariantData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new category.
  ///
  /// Takes a [category] object as input and sends a POST request to the Akeneo API
  /// to create a new category with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createCategory(Category category) async {
    return _handleApiRequest(() async {
      final categoryData = category.toJson();
      return await _httpWrapper.post('api/rest/v1/categories', categoryData);
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retrieves a category by its category code.
  ///
  /// Takes a [categoryCode] as input and sends a GET request to the Akeneo API
  /// to fetch the category associated with the specified category code.
  ///
  /// Returns a [Category] object representing the fetched category.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<Category> getCategory(String categoryCode) async {
    return _handleApiRequest<Category>(
      () async {
        return await _httpWrapper.get('api/rest/v1/categories/$categoryCode');
      },
      (json) => Category.fromJson(json),
    );
  }

  /// Retrieves a paginated list of categories.
  ///
  /// Takes an optional [params] parameter of type [QueryParameter] that allows you to customize
  /// the query parameters for the API request.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing the paginated list of categories.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<AkeneoPaginatedResponse> getCategories({
    QueryParameter? params,
  }) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/categories',
          queryParameters: params?.toJson(),
        );
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing category.
  ///
  /// Takes an [updatedCategory] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified category with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateCategory(Category updatedCategory) async {
    return _handleApiRequest(() async {
      final updatedCategoryData = updatedCategory.toJson();
      final categoryCode = updatedCategory.code;
      updatedCategoryData.remove('code');

      return await _httpWrapper.patch(
        'api/rest/v1/categories/$categoryCode',
        updatedCategoryData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new product.
  ///
  /// Takes a [product] object as input and sends a POST request to the Akeneo API
  /// to create a new product with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createProduct(Product product) async {
    return _handleApiRequest(() async {
      final productData = product.toJson();
      return await _httpWrapper.post('api/rest/v1/products', productData);
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retrieves a product by its product identifier.
  ///
  /// Takes a [productIdentifier] as input and sends a GET request to the Akeneo API
  /// to fetch the product associated with the specified product identifier.
  ///
  /// Returns a [Product] object representing the fetched product.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<Product> getProduct(String productIdentifier) async {
    return _handleApiRequest<Product>(
      () async {
        return await _httpWrapper
            .get('api/rest/v1/products/$productIdentifier');
      },
      (json) => Product.fromJson(json),
    );
  }

  /// Fetches a list of products from the Akeneo API based on optional query parameters.
  ///
  /// [params]: An instance of [QueryParameter] that holds query parameters for filtering and pagination.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing the retrieved products.
  ///
  /// Throws an [ApiException] if an error occurs during the API request
  ///
  /// Example usage:
  /// ```dart
  ///     /// filter to get products added with in the week
  ///     final queryParameters = QueryParameter(
  ///        filters: [
  ///          SearchFilter(
  ///            field: 'created',
  ///            operator: AkeneoOperator.greaterThan,
  ///            value: DateTime.now().subtract(Duration(days: 7)).toIso8601String(),
  ///          ),
  ///        ],
  ///        limit: 10,
  ///        page: 1,
  ///      );
  ///
  ///     final newProductsResponse = await getProducts(params: queryParameters);
  /// ```
  Future<AkeneoPaginatedResponse> getProducts({
    QueryParameter? params,
  }) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/products',
          queryParameters: params?.toJson(),
        );
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing product.
  ///
  /// Takes an [updatedProduct] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified product with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateProduct(Product updatedProduct) async {
    return _handleApiRequest(() async {
      final updatedProductData = updatedProduct.toJson();
      final productIdentifier = updatedProduct.identifier;
      updatedProductData.remove('identifier');

      return await _httpWrapper.patch(
        'api/rest/v1/products/$productIdentifier',
        updatedProductData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Deletes a product by its product identifier.
  ///
  /// Takes a [productIdentifier] as input and sends a DELETE request to the Akeneo API
  /// to delete the product associated with the specified product identifier.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> deleteProduct(String productIdentifier) async {
    return _handleApiRequest(() async {
      return await _httpWrapper
          .delete('api/rest/v1/products/$productIdentifier');
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new product model.
  ///
  /// Takes a [productModel] object as input and sends a POST request to the Akeneo API
  /// to create a new product model with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createProductModel(ProductModel productModel) async {
    return _handleApiRequest(() async {
      final productModelData = productModel.toJson();
      return await _httpWrapper.post(
          'api/rest/v1/product-models', productModelData);
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retrieves a product model by its product model code.
  ///
  /// Takes a [productModelCode] as input and sends a GET request to the Akeneo API
  /// to fetch the product model associated with the specified product model code.
  ///
  /// Returns a [ProductModel] object representing the fetched product model.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<ProductModel> getProductModel(String productModelCode) async {
    return _handleApiRequest<ProductModel>(
      () async {
        return await _httpWrapper
            .get('api/rest/v1/product-models/$productModelCode');
      },
      (json) => ProductModel.fromJson(json),
    );
  }

  /// Fetches a list of product models.
  ///
  /// Takes an optional [params] parameter of type [QueryParameter], which can be used
  /// to specify query parameters for the API request.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing a list of product models.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<AkeneoPaginatedResponse> getProductModels({
    QueryParameter? params,
  }) async {
    return _handleApiRequest<AkeneoPaginatedResponse>(
      () async {
        return await _httpWrapper.get(
          'api/rest/v1/product-models',
          queryParameters: params?.toJson(),
        );
      },
      (json) => AkeneoPaginatedResponse.fromJson(json),
    );
  }

  /// Updates an existing product model.
  ///
  /// Takes an [updatedProductModel] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified product model with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateProductModel(
      ProductModel updatedProductModel) async {
    return _handleApiRequest(() async {
      final updatedProductModelData = updatedProductModel.toJson();
      final productModelCode = updatedProductModel.code;
      updatedProductModelData.remove('code');
      updatedProductModelData.remove('family_variant');

      return await _httpWrapper.patch(
        'api/rest/v1/product-models/$productModelCode',
        updatedProductModelData,
      );
    }, (json) => http.Response(json.toString(), 204));
  }

  /// Creates a new media file associated with a product.
  ///
  /// Takes a [productIdentifier], [attributeCode], and [filePath] as input and sends a POST request
  /// to the Akeneo API to create a new media file for the specified product and attribute.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createProductMediaFile(
    String productIdentifier,
    String attributeCode,
    String filePath,
  ) async {
    return _handleApiRequest(() async {
      return await _httpWrapper.postFile(
        url: 'api/rest/v1/media-files',
        filePath: filePath,
        payload: {
          'product': {
            'identifier': productIdentifier,
            'attribute': attributeCode,
            'scope': null,
            'locale': null,
          },
        },
      );
    }, (json) => http.Response(json.toString(), 201));
  }

  /// Retruns url for media file download.
  String getMediaFileUrl(String mediaFileIdentifier) {
    return '${_httpWrapper.endpoint}/api/rest/v1/media-files/$mediaFileIdentifier/download';
  }
}
