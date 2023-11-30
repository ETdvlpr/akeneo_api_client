import 'dart:convert';

import 'package:akeneo_api_client/akeneo_api_client.dart';
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
  }) : _httpWrapper = HttpWrapper(
          endpoint: endpoint,
          clientId: clientId,
          clientSecret: clientSecret,
          userName: userName,
          password: password,
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

  /// Creates a new attribute on the Akeneo API.
  ///
  /// The [attribute] parameter represents the attribute to be created.
  Future<http.Response> createAttribute(Attribute attribute) async {
    try {
      final attributeData = attribute.toJson();
      final response =
          await _httpWrapper.post('api/rest/v1/attributes', attributeData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow; // Rethrow ApiException directly
    } catch (e) {
      throw ApiException('An error occurred while creating the attribute: $e');
    }
  }

  /// Retrieves an attribute from the Akeneo API by its [attributeCode].
  ///
  /// If [cacheAttributes] is enabled and the attribute is already cached,
  /// the cached attribute will be returned.
  Future<Attribute> getAttribute(String attributeCode) async {
    if (cacheAttributes && _attributes.containsKey(attributeCode)) {
      return _attributes[attributeCode]!;
    }

    try {
      final response =
          await _httpWrapper.get('api/rest/v1/attributes/$attributeCode');
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final Attribute attribute = Attribute.fromJson(json);

        if (cacheAttributes) {
          _attributes[attributeCode] = attribute;
        }

        return attribute;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } catch (e) {
      throw ApiException('An error occurred while fetching the attribute: $e');
    }
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
    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/attributes',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching attributes: $e');
    }
  }

  /// Updates an existing attribute on the Akeneo API.
  ///
  /// The [updatedAttribute] parameter contains the updated attribute data.
  Future<http.Response> updateAttribute(Attribute updatedAttribute) async {
    try {
      final updatedAttributeData = updatedAttribute.toJson();
      final attributeCode = updatedAttribute.code;

      // Remove uneditable values from data
      updatedAttributeData.remove('code');
      updatedAttributeData.remove('type');
      updatedAttributeData.remove('scopable');
      updatedAttributeData.remove('localizable');
      updatedAttributeData.remove('unique');

      final response = await _httpWrapper.patch(
          'api/rest/v1/attributes/$attributeCode', updatedAttributeData);
      if (response.statusCode == 204) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the attribute: $e');
    }
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
    try {
      final attributeGroupData = attributeGroup.toJson();
      final response = await _httpWrapper.post(
          'api/rest/v1/attribute-groups', attributeGroupData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the attribute group: $e');
    }
  }

  /// Retrieves an attribute group by its code.
  ///
  /// This method sends a GET request to the Akeneo API to retrieve an attribute group
  /// based on the provided [attributeGroupCode].
  /// Returns an instance of [AttributeGroup] containing the retrieved attribute group data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request.
  Future<AttributeGroup> getAttributeGroup(String attributeGroupCode) async {
    try {
      final response = await _httpWrapper
          .get('api/rest/v1/attribute-groups/$attributeGroupCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return AttributeGroup.fromJson(json);
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the attribute group: $e');
    }
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
    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/attribute-groups',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching attribute groups: $e');
    }
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
    try {
      final updatedAttributeGroupData = updatedAttributeGroup.toJson();
      final attributeGroupCode = updatedAttributeGroup.code;
      updatedAttributeGroupData.remove('code');

      final response = await _httpWrapper.patch(
        'api/rest/v1/attribute-groups/$attributeGroupCode',
        updatedAttributeGroupData,
      );

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the attribute group: $e');
    }
  }

  /// Creates a new attribute option.
  ///
  /// Takes an [AttributeOption] object as input and sends a POST request to the
  /// Akeneo API to create the attribute option.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createAttributeOption(
      AttributeOption attributeOption) async {
    try {
      final attributeOptionData = attributeOption.toJson();
      final response = await _httpWrapper.post(
        'api/rest/v1/attributes/${attributeOption.attribute}/options',
        attributeOptionData,
      );

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the attribute option: $e');
    }
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

    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/attributes/$attributeCode/options/$attributeOptionCode',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final AttributeOption attributeOption = AttributeOption.fromJson(json);

        if (cacheAttributes) {
          _attributeOptions[cacheKey] =
              attributeOption; // Cache the attribute option
        }

        return attributeOption;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the attribute option: $e');
    }
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
    try {
      final response = await _httpWrapper
          .get('api/rest/v1/attributes/$attributeCode/options');

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching attribute options: $e');
    }
  }

  /// Updates an existing attribute option.
  ///
  /// Takes an [updatedAttributeOption] as input and sends a PATCH request to the Akeneo API
  /// to update the specified attribute option with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateAttributeOption(
      AttributeOption updatedAttributeOption) async {
    try {
      final updatedAttributeOptionData = updatedAttributeOption.toJson();
      final attributeOptionCode = updatedAttributeOption.code;
      updatedAttributeOptionData.remove('code');

      final response = await _httpWrapper.patch(
        'api/rest/v1/attributes/${updatedAttributeOption.attribute}/options/$attributeOptionCode',
        updatedAttributeOptionData,
      );

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the attribute option: $e');
    }
  }

  /// Creates a new family.
  ///
  /// Takes a [family] object as input and sends a POST request to the Akeneo API
  /// to create a new family with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createFamily(Family family) async {
    try {
      final familyData = family.toJson();
      final response =
          await _httpWrapper.post('api/rest/v1/families', familyData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while creating the family: $e');
    }
  }

  /// Retrieves a family by its family code.
  ///
  /// Takes a [familyCode] as input and sends a GET request to the Akeneo API
  /// to fetch the family associated with the specified family code.
  ///
  /// Returns a [Family] object representing the fetched family.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<Family> getFamily(String familyCode) async {
    try {
      final response =
          await _httpWrapper.get('api/rest/v1/families/$familyCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Family.fromJson(json);
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching the family: $e');
    }
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
    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/families',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching families: $e');
    }
  }

  /// Updates an existing family.
  ///
  /// Takes an [updatedFamily] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified family with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateFamily(Family updatedFamily) async {
    try {
      final updatedFamilyData = updatedFamily.toJson();
      final familyCode = updatedFamily.code;
      updatedFamilyData.remove('code');

      final response = await _httpWrapper.patch(
        'api/rest/v1/families/$familyCode',
        updatedFamilyData,
      );

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the family: $e');
    }
  }

  /// Creates a new family variant.
  ///
  /// Takes a [family] code and a [familyVariant] object as input and sends a POST request
  /// to the Akeneo API to create a new family variant associated with the specified family.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createFamilyVariant(
      String family, FamilyVariant familyVariant) async {
    try {
      final familyVariantData = familyVariant.toJson();
      final response = await _httpWrapper.post(
        'api/rest/v1/families/$family/variants',
        familyVariantData,
      );

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the family variant: $e');
    }
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
    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/families/$family/variants/$familyVariantCode',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return FamilyVariant.fromJson(json);
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the family variant: $e');
    }
  }

  /// Retrieves a paginated list of family variants for a given family.
  ///
  /// Takes a [family] code as input and sends a GET request to the Akeneo API
  /// to fetch a paginated list of family variants associated with the specified family.
  ///
  /// Returns an [AkeneoPaginatedResponse] containing the paginated list of family variants.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<AkeneoPaginatedResponse> getFamilyVariants(String family) async {
    try {
      final response =
          await _httpWrapper.get('api/rest/v1/families/$family/variants');

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching family variants: $e');
    }
  }

  /// Updates an existing family variant.
  ///
  /// Takes a [family] code and an [updatedFamilyVariant] object as input and sends
  /// a PATCH request to the Akeneo API to update the specified family variant with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateFamilyVariant(
      String family, FamilyVariant updatedFamilyVariant) async {
    try {
      final updatedFamilyVariantData = updatedFamilyVariant.toJson();
      final familyVariantCode = updatedFamilyVariant.code;
      updatedFamilyVariantData.remove('code');

      final response = await _httpWrapper.patch(
        'api/rest/v1/families/$family/variants/$familyVariantCode',
        updatedFamilyVariantData,
      );

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the family variant: $e');
    }
  }

  /// Creates a new category.
  ///
  /// Takes a [category] object as input and sends a POST request to the Akeneo API
  /// to create a new category with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createCategory(Category category) async {
    try {
      final categoryData = category.toJson();
      final response =
          await _httpWrapper.post('api/rest/v1/categories', categoryData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while creating the category: $e');
    }
  }

  /// Retrieves a category by its category code.
  ///
  /// Takes a [categoryCode] as input and sends a GET request to the Akeneo API
  /// to fetch the category associated with the specified category code.
  ///
  /// Returns a [Category] object representing the fetched category.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<Category> getCategory(String categoryCode) async {
    try {
      final response =
          await _httpWrapper.get('api/rest/v1/categories/$categoryCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Category.fromJson(json);
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching the category: $e');
    }
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
    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/categories',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching categories: $e');
    }
  }

  /// Updates an existing category.
  ///
  /// Takes an [updatedCategory] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified category with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateCategory(Category updatedCategory) async {
    try {
      final updatedCategoryData = updatedCategory.toJson();
      final categoryCode = updatedCategory.code;
      updatedCategoryData.remove('code');

      final response = await _httpWrapper.patch(
        'api/rest/v1/categories/$categoryCode',
        updatedCategoryData,
      );

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the category: $e');
    }
  }

  /// Creates a new product.
  ///
  /// Takes a [product] object as input and sends a POST request to the Akeneo API
  /// to create a new product with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createProduct(Product product) async {
    try {
      final productData = product.toJson();
      final response =
          await _httpWrapper.post('api/rest/v1/products', productData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while creating the product: $e');
    }
  }

  /// Retrieves a product by its product identifier.
  ///
  /// Takes a [productIdentifier] as input and sends a GET request to the Akeneo API
  /// to fetch the product associated with the specified product identifier.
  ///
  /// Returns a [Product] object representing the fetched product.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<Product> getProduct(String productIdentifier) async {
    try {
      final response =
          await _httpWrapper.get('api/rest/v1/products/$productIdentifier');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Product.fromJson(json);
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching the product: $e');
    }
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
  ///     // filter to get products added with in the week
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
    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/products',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching products: $e');
    }
  }

  /// Updates an existing product.
  ///
  /// Takes an [updatedProduct] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified product with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateProduct(Product updatedProduct) async {
    try {
      final updatedProductData = updatedProduct.toJson();
      final productIdentifier = updatedProduct.identifier;
      updatedProductData.remove('identifier');

      final response = await _httpWrapper.patch(
        'api/rest/v1/products/$productIdentifier',
        updatedProductData,
      );

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the product: $e');
    }
  }

  /// Deletes a product by its product identifier.
  ///
  /// Takes a [productIdentifier] as input and sends a DELETE request to the Akeneo API
  /// to delete the product associated with the specified product identifier.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> deleteProduct(String productIdentifier) async {
    try {
      final response =
          await _httpWrapper.delete('api/rest/v1/products/$productIdentifier');

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while deleting the product: $e');
    }
  }

  /// Creates a new product model.
  ///
  /// Takes a [productModel] object as input and sends a POST request to the Akeneo API
  /// to create a new product model with the provided data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> createProductModel(ProductModel productModel) async {
    try {
      final productModelData = productModel.toJson();
      final response = await _httpWrapper.post(
          'api/rest/v1/product-models', productModelData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the product model: $e');
    }
  }

  /// Retrieves a product model by its product model code.
  ///
  /// Takes a [productModelCode] as input and sends a GET request to the Akeneo API
  /// to fetch the product model associated with the specified product model code.
  ///
  /// Returns a [ProductModel] object representing the fetched product model.
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<ProductModel> getProductModel(String productModelCode) async {
    try {
      final response = await _httpWrapper
          .get('api/rest/v1/product-models/$productModelCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return ProductModel.fromJson(json);
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the product model: $e');
    }
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
    try {
      final response = await _httpWrapper.get(
        'api/rest/v1/product-models',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching product models: $e');
    }
  }

  /// Updates an existing product model.
  ///
  /// Takes an [updatedProductModel] object as input and sends a PATCH request to the Akeneo API
  /// to update the specified product model with the new data.
  ///
  /// Throws an [ApiException] if an error occurs during the API request or response.
  Future<http.Response> updateProductModel(
      ProductModel updatedProductModel) async {
    try {
      final updatedProductModelData = updatedProductModel.toJson();
      final productModelCode = updatedProductModel.code;
      updatedProductModelData.remove('code');
      updatedProductModelData.remove('family_variant');

      final response = await _httpWrapper.patch(
        'api/rest/v1/product-models/$productModelCode',
        updatedProductModelData,
      );

      if (response.statusCode != 204) {
        throw _createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the product model: $e');
    }
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
    try {
      final response = await _httpWrapper.postFile(
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

      if (response.statusCode == 201) {
        return response;
      } else {
        throw _createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the product media file: $e');
    }
  }

  /// Retruns url for media file download.
  String getMediaFileUrl(String mediaFileIdentifier) {
    return '${_httpWrapper.endpoint}/api/rest/v1/media-files/$mediaFileIdentifier/download';
  }
}
