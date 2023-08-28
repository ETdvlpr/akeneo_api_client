import 'dart:convert';

import 'package:akeneo_api_client/akeneo_api_client.dart';
import 'package:http/http.dart' as http;

import 'http_wrapper.dart';

class AkeneoApiClient {
  final HttpWrapper httpWrapper;
  final bool cacheAttributes;
  Map<String, Attribute> attributes = {};
  Map<String, AttributeOption> attributeOptions = {};

  AkeneoApiClient({
    required Uri endpoint,
    required String clientId,
    required String clientSecret,
    required String userName,
    required String password,
    this.cacheAttributes = true,
  }) : httpWrapper = HttpWrapper(
          endpoint: endpoint,
          clientId: clientId,
          clientSecret: clientSecret,
          userName: userName,
          password: password,
        );

  ApiException createApiExceptionFromResponse(String responseBody) {
    final Map<String, dynamic> json = jsonDecode(responseBody);
    final errorResponse = ErrorResponse.fromJson(json);
    return ApiException(errorResponse.message, errorResponse: errorResponse);
  }

  // Attribute methods
  Future<http.Response> createAttribute(Attribute attribute) async {
    try {
      final attributeData = attribute.toJson();
      final response =
          await httpWrapper.post('api/rest/v1/attributes', attributeData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow; // Rethrow ApiException directly
    } catch (e) {
      throw ApiException('An error occurred while creating the attribute: $e');
    }
  }

  Future<Attribute> getAttribute(String attributeCode) async {
    if (cacheAttributes && attributes.containsKey(attributeCode)) {
      return attributes[attributeCode]!;
    }

    try {
      final response =
          await httpWrapper.get('api/rest/v1/attributes/$attributeCode');
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final Attribute attribute = Attribute.fromJson(json);

        if (cacheAttributes) {
          attributes[attributeCode] = attribute;
        }

        return attribute;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } catch (e) {
      throw ApiException('An error occurred while fetching the attribute: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getAttributes({
    QueryParameter? params,
  }) async {
    try {
      final response = await httpWrapper.get(
        'api/rest/v1/attributes',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching attributes: $e');
    }
  }

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

      final response = await httpWrapper.patch(
          'api/rest/v1/attributes/$attributeCode', updatedAttributeData);
      if (response.statusCode == 204) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the attribute: $e');
    }
  }

  // Attribute group methods

  Future<http.Response> createAttributeGroup(
      AttributeGroup attributeGroup) async {
    try {
      final attributeGroupData = attributeGroup.toJson();
      final response = await httpWrapper.post(
          'api/rest/v1/attribute-groups', attributeGroupData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the attribute group: $e');
    }
  }

  Future<AttributeGroup> getAttributeGroup(String attributeGroupCode) async {
    try {
      final response = await httpWrapper
          .get('api/rest/v1/attribute-groups/$attributeGroupCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return AttributeGroup.fromJson(json);
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the attribute group: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getAttributeGroups({
    QueryParameter? params,
  }) async {
    try {
      final response = await httpWrapper.get(
        'api/rest/v1/attribute-groups',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching attribute groups: $e');
    }
  }

  Future<http.Response> updateAttributeGroup(
      AttributeGroup updatedAttributeGroup) async {
    try {
      final updatedAttributeGroupData = updatedAttributeGroup.toJson();
      final attributeGroupCode = updatedAttributeGroup.code;
      updatedAttributeGroupData.remove('code');

      final response = await httpWrapper.patch(
        'api/rest/v1/attribute-groups/$attributeGroupCode',
        updatedAttributeGroupData,
      );

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the attribute group: $e');
    }
  }

  // Attribute option methods
  Future<http.Response> createAttributeOption(
      AttributeOption attributeOption) async {
    try {
      final attributeOptionData = attributeOption.toJson();
      final response = await httpWrapper.post(
        'api/rest/v1/attributes/${attributeOption.attribute}/options',
        attributeOptionData,
      );

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the attribute option: $e');
    }
  }

  Future<AttributeOption> getAttributeOption(
      String attributeCode, String attributeOptionCode) async {
    final cacheKey = '$attributeCode:$attributeOptionCode';

    if (cacheAttributes && attributeOptions.containsKey(cacheKey)) {
      return attributeOptions[cacheKey]!;
    }

    try {
      final response = await httpWrapper.get(
        'api/rest/v1/attributes/$attributeCode/options/$attributeOptionCode',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final AttributeOption attributeOption = AttributeOption.fromJson(json);

        if (cacheAttributes) {
          attributeOptions[cacheKey] =
              attributeOption; // Cache the attribute option
        }

        return attributeOption;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the attribute option: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getAttributeOptions(
      String attributeCode) async {
    try {
      final response = await httpWrapper
          .get('api/rest/v1/attributes/$attributeCode/options');

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching attribute options: $e');
    }
  }

  Future<http.Response> updateAttributeOption(
      AttributeOption updatedAttributeOption) async {
    try {
      final updatedAttributeOptionData = updatedAttributeOption.toJson();
      final attributeOptionCode = updatedAttributeOption.code;
      updatedAttributeOptionData.remove('code');

      final response = await httpWrapper.patch(
        'api/rest/v1/attributes/${updatedAttributeOption.attribute}/options/$attributeOptionCode',
        updatedAttributeOptionData,
      );

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the attribute option: $e');
    }
  }

  // Family methods
  Future<http.Response> createFamily(Family family) async {
    try {
      final familyData = family.toJson();
      final response =
          await httpWrapper.post('api/rest/v1/families', familyData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while creating the family: $e');
    }
  }

  Future<Family> getFamily(String familyCode) async {
    try {
      final response =
          await httpWrapper.get('api/rest/v1/families/$familyCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Family.fromJson(json);
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching the family: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getFamilies({
    QueryParameter? params,
  }) async {
    try {
      final response = await httpWrapper.get(
        'api/rest/v1/families',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching families: $e');
    }
  }

  Future<http.Response> updateFamily(Family updatedFamily) async {
    try {
      final updatedFamilyData = updatedFamily.toJson();
      final familyCode = updatedFamily.code;
      updatedFamilyData.remove('code');

      final response = await httpWrapper.patch(
        'api/rest/v1/families/$familyCode',
        updatedFamilyData,
      );

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the family: $e');
    }
  }

  // Family variant methods
  Future<http.Response> createFamilyVariant(
      String family, FamilyVariant familyVariant) async {
    try {
      final familyVariantData = familyVariant.toJson();
      final response = await httpWrapper.post(
        'api/rest/v1/families/$family/variants',
        familyVariantData,
      );

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the family variant: $e');
    }
  }

  Future<FamilyVariant> getFamilyVariant(
      String family, String familyVariantCode) async {
    try {
      final response = await httpWrapper.get(
        'api/rest/v1/families/$family/variants/$familyVariantCode',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return FamilyVariant.fromJson(json);
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the family variant: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getFamilyVariants(String family) async {
    try {
      final response =
          await httpWrapper.get('api/rest/v1/families/$family/variants');

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching family variants: $e');
    }
  }

  Future<http.Response> updateFamilyVariant(
      String family, FamilyVariant updatedFamilyVariant) async {
    try {
      final updatedFamilyVariantData = updatedFamilyVariant.toJson();
      final familyVariantCode = updatedFamilyVariant.code;
      updatedFamilyVariantData.remove('code');

      final response = await httpWrapper.patch(
        'api/rest/v1/families/$family/variants/$familyVariantCode',
        updatedFamilyVariantData,
      );

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the family variant: $e');
    }
  }

  // Category methods
  Future<http.Response> createCategory(Category category) async {
    try {
      final categoryData = category.toJson();
      final response =
          await httpWrapper.post('api/rest/v1/categories', categoryData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while creating the category: $e');
    }
  }

  Future<Category> getCategory(String categoryCode) async {
    try {
      final response =
          await httpWrapper.get('api/rest/v1/categories/$categoryCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Category.fromJson(json);
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching the category: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getCategories({
    QueryParameter? params,
  }) async {
    try {
      final response = await httpWrapper.get(
        'api/rest/v1/categories',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching categories: $e');
    }
  }

  Future<http.Response> updateCategory(Category updatedCategory) async {
    try {
      final updatedCategoryData = updatedCategory.toJson();
      final categoryCode = updatedCategory.code;
      updatedCategoryData.remove('code');

      final response = await httpWrapper.patch(
        'api/rest/v1/categories/$categoryCode',
        updatedCategoryData,
      );

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the category: $e');
    }
  }

  // Product methods
  Future<http.Response> createProduct(Product product) async {
    try {
      final productData = product.toJson();
      final response =
          await httpWrapper.post('api/rest/v1/products', productData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while creating the product: $e');
    }
  }

  Future<Product> getProduct(String productIdentifier) async {
    try {
      final response =
          await httpWrapper.get('api/rest/v1/products/$productIdentifier');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Product.fromJson(json);
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching the product: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getProducts({
    QueryParameter? params,
  }) async {
    try {
      final response = await httpWrapper.get(
        'api/rest/v1/products',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching products: $e');
    }
  }

  Future<http.Response> updateProduct(Product updatedProduct) async {
    try {
      final updatedProductData = updatedProduct.toJson();
      final productIdentifier = updatedProduct.identifier;
      updatedProductData.remove('identifier');

      final response = await httpWrapper.patch(
        'api/rest/v1/products/$productIdentifier',
        updatedProductData,
      );

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while updating the product: $e');
    }
  }

  Future<http.Response> deleteProduct(String productIdentifier) async {
    try {
      final response =
          await httpWrapper.delete('api/rest/v1/products/$productIdentifier');

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while deleting the product: $e');
    }
  }

  // Product model methods

  Future<http.Response> createProductModel(ProductModel productModel) async {
    try {
      final productModelData = productModel.toJson();
      final response = await httpWrapper.post(
          'api/rest/v1/product-models', productModelData);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the product model: $e');
    }
  }

  Future<ProductModel> getProductModel(String productModelCode) async {
    try {
      final response =
          await httpWrapper.get('api/rest/v1/product-models/$productModelCode');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return ProductModel.fromJson(json);
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while fetching the product model: $e');
    }
  }

  Future<AkeneoPaginatedResponse> getProductModels({
    QueryParameter? params,
  }) async {
    try {
      final response = await httpWrapper.get(
        'api/rest/v1/product-models',
        queryParameters: params?.toJson(),
      );

      if (response.statusCode == 200) {
        return AkeneoPaginatedResponse.fromJson(jsonDecode(response.body));
      } else {
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An error occurred while fetching product models: $e');
    }
  }

  Future<http.Response> updateProductModel(
      ProductModel updatedProductModel) async {
    try {
      final updatedProductModelData = updatedProductModel.toJson();
      final productModelCode = updatedProductModel.code;
      updatedProductModelData.remove('code');
      updatedProductModelData.remove('family_variant');

      final response = await httpWrapper.patch(
        'api/rest/v1/product-models/$productModelCode',
        updatedProductModelData,
      );

      if (response.statusCode != 204) {
        throw createApiExceptionFromResponse(response.body);
      }
      return response;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while updating the product model: $e');
    }
  }

  Future<http.Response> createProductMediaFile(
    String productIdentifier,
    String attributeCode,
    String filePath,
  ) async {
    try {
      final response = await httpWrapper.postFile(
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
        throw createApiExceptionFromResponse(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
          'An error occurred while creating the product media file: $e');
    }
  }
}
