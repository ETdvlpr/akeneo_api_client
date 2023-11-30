import 'package:akeneo_api_client/akeneo_api_client.dart';
import 'package:test/test.dart';

//please don't forget to delete test data as the rest api is not transactional
void main() {
  group('AkeneoApiClient', () {
    late AkeneoApiClient apiClient;

    setUp(() {
      apiClient = AkeneoApiClient(
        endpoint: Uri.parse('http://localhost'),
        clientId: '1_api_connection_1',
        clientSecret: 'api_secret',
        userName: 'admin',
        password: 'Admin123',
      );
    });

    test('Category CRUD', () async {
      const category = Category(
        code: 'test_category',
      );

      // Check if category already exists
      Category? existingCategory;
      try {
        existingCategory = await apiClient.getCategory(category.code);
      } catch (e) {
        print(e);
      }

      if (existingCategory == null) {
        final createResponse = await apiClient.createCategory(category);
        expect(createResponse.statusCode, equals(201));
      }

      final getCategoryResponse = await apiClient.getCategory(category.code);
      expect(getCategoryResponse.code, equals(category.code));

      final updatedCategory = getCategoryResponse.copyWith(
        labels: {'en_US': 'Updated Test Category'},
      );
      final updateResponse = await apiClient.updateCategory(updatedCategory);
      expect(updateResponse.statusCode, equals(204));

      final categoriesResponse = await apiClient.getCategories();
      expect(categoriesResponse.links.self, isNotNull);
      expect(categoriesResponse.currentPage, isNotNull);
      expect(categoriesResponse.embedded.items, isNotEmpty);
    });

    test('Create, Get, Update Attribute Group', () async {
      const attributeGroup = AttributeGroup(code: 'test_group');

      // Check if attribute group already exists
      AttributeGroup? existingAttributeGroup;
      try {
        existingAttributeGroup =
            await apiClient.getAttributeGroup(attributeGroup.code);
      } catch (e) {
        print(e);
      }

      if (existingAttributeGroup == null) {
        final createResponse =
            await apiClient.createAttributeGroup(attributeGroup);
        expect(createResponse.statusCode, equals(201));
      }

      // Get
      final getResponse =
          await apiClient.getAttributeGroup(attributeGroup.code);
      expect(getResponse.code, equals(attributeGroup.code));

      // Update
      final updatedAttributeGroup = getResponse.copyWith(labels: {
        'en_US': 'Updated Test Group',
      });
      final updateResponse =
          await apiClient.updateAttributeGroup(updatedAttributeGroup);
      expect(updateResponse.statusCode, equals(204));
    });

    test('Create, Get, Update Attribute', () async {
      Attribute attribute = Attribute(
        code: 'test_attr',
        type: AttributeType.simpleSelect.value,
        group: 'test_group',
      );

      // Check if attribute already exists
      Attribute? existingAttribute;
      try {
        existingAttribute = await apiClient.getAttribute(attribute.code);
      } catch (e) {
        print(e);
      }
      if (existingAttribute == null) {
        final createResponse = await apiClient.createAttribute(attribute);
        expect(createResponse.statusCode, equals(201));
      }

      // Get
      final getResponse = await apiClient.getAttribute(attribute.code);
      expect(getResponse.code, equals(attribute.code));

      // Update
      final updatedAttribute = getResponse.copyWith(labels: {
        'en_US': 'Test Attribute',
      });
      final updateResponse = await apiClient.updateAttribute(updatedAttribute);
      expect(updateResponse.statusCode, equals(204));
    });

    test('Create, Get, Update Attribute Option', () async {
      const attributeOption = AttributeOption(
        code: 'test_attr_option',
        attribute: 'test_attr',
      );

      // Check if attribute option already exists
      AttributeOption? existingAttributeOption;
      try {
        existingAttributeOption = await apiClient.getAttributeOption(
            attributeOption.attribute, attributeOption.code);
      } catch (e) {
        print(e);
      }
      if (existingAttributeOption == null) {
        final createResponse =
            await apiClient.createAttributeOption(attributeOption);
        expect(createResponse.statusCode, equals(201));
      }

      // Get
      final getResponse = await apiClient.getAttributeOption(
          attributeOption.attribute, attributeOption.code);
      expect(getResponse.code, equals(attributeOption.code));

      // Update
      final updatedAttributeOption = getResponse.copyWith(labels: {
        'en_US': 'Test Attribute Option',
      });
      final updateResponse =
          await apiClient.updateAttributeOption(updatedAttributeOption);
      expect(updateResponse.statusCode, equals(204));
    });

    test('Family CRUD', () async {
      const family = Family(
        code: 'test_family',
        labels: {'en_US': 'Test Family'},
        attributes: ['test_attr'],
      );

      //check if family already exists
      Family? existingFamily;
      try {
        existingFamily = await apiClient.getFamily(family.code);
      } catch (e) {
        printException(e);
      }
      print(existingFamily);
      if (existingFamily == null) {
        final createResponse = await apiClient.createFamily(family);
        expect(createResponse.statusCode, equals(201));
      }

      final getFamilyResponse = await apiClient.getFamily(family.code);
      expect(getFamilyResponse.code, equals(family.code));

      final updatedFamily = getFamilyResponse.copyWith(
        labels: {'en_US': 'Updated Test Family'},
        attributes: ["sku", 'test_attr'],
      );
      final updateResponse = await apiClient.updateFamily(updatedFamily);
      expect(updateResponse.statusCode, equals(204));
    });

    test('Family Variant CRUD', () async {
      const familyVariant = FamilyVariant(
        code: 'test_family_variant',
        labels: {'en_US': 'Test Family Variant'},
        variantAttributeSets: [
          VariantAttributeSet(
            level: 1,
            axes: ['test_attr'],
            attributes: ['test_attr'],
          ),
        ],
      );

      // check if family variant already exists
      FamilyVariant? existingFamilyVariant;

      try {
        existingFamilyVariant =
            await apiClient.getFamilyVariant('test_family', familyVariant.code);
      } catch (e) {
        print(e);
      }

      if (existingFamilyVariant == null) {
        final createResponse =
            await apiClient.createFamilyVariant('test_family', familyVariant);
        expect(createResponse.statusCode, equals(201));
      }

      final getFamilyVariantResponse = await apiClient.getFamilyVariant(
        'test_family',
        familyVariant.code,
      );
      expect(getFamilyVariantResponse.code, equals(familyVariant.code));

      final updatedFamilyVariant = getFamilyVariantResponse.copyWith(
        labels: {'en_US': 'Updated Test Family Variant'},
      );
      final updateResponse = await apiClient.updateFamilyVariant(
        'test_family',
        updatedFamilyVariant,
      );
      expect(updateResponse.statusCode, equals(204));
    });

    test('Product CRUD', () async {
      final product = Product(
        identifier: 'test_product',
        family: 'test_family',
        categories: ['test_category'],
        values: {
          'test_attr': [
            Value(data: 'test_attr_option'),
          ]
        },
      );

      //check if product already exists
      Product? existingProduct;

      try {
        existingProduct = await apiClient.getProduct(product.identifier);
      } catch (e) {
        printException(e);
      }

      if (existingProduct == null) {
        final createResponse = await apiClient.createProduct(product);
        expect(createResponse.statusCode, equals(201));
      }

      final getProductResponse = await apiClient.getProduct(product.identifier);
      expect(getProductResponse.identifier, equals(product.identifier));

      final updatedProduct = getProductResponse.copyWith(
        enabled: true,
      );
      final updateResponse = await apiClient.updateProduct(updatedProduct);
      expect(updateResponse.statusCode, equals(204));

      final deleteResponse = await apiClient.deleteProduct(product.identifier);
      expect(deleteResponse.statusCode, equals(204));
    });

    test('ProductModel CRUD', () async {
      const productModel = ProductModel(
        code: 'test_product_model',
        familyVariant: 'test_family_variant',
      );

      //check if product model already exists
      ProductModel? existingProductModel;

      try {
        existingProductModel =
            await apiClient.getProductModel(productModel.code);
      } catch (e) {
        printException(e);
      }

      if (existingProductModel == null) {
        final createResponse = await apiClient.createProductModel(productModel);
        expect(createResponse.statusCode, equals(201));
      }

      final getProductModelResponse =
          await apiClient.getProductModel(productModel.code);
      expect(getProductModelResponse.code, equals(productModel.code));

      final updatedProductModel = getProductModelResponse.copyWith(
        values: {
          'test_attr': [
            Value(data: 'test_attr_option'),
          ]
        },
        categories: ['test_category'],
      );
      final updateResponse =
          await apiClient.updateProductModel(updatedProductModel);
      expect(updateResponse.statusCode, equals(204));
    });

    test('product search', () async {
      var productSearchQuery = QueryParameter(limit: 6);
      final searchResponse =
          await apiClient.getProducts(params: productSearchQuery);
      expect(searchResponse.embedded.items.length, equals(6));
    });

    test('product model search', () async {
      var productModelSearchQuery = QueryParameter(
        filters: [
          SearchFilter(
            field: 'categories',
            operator: AkeneoOperator.inValue,
            value: ['test_category'],
          ),
        ],
      );

      final searchResponse =
          await apiClient.getProductModels(params: productModelSearchQuery);
      expect(searchResponse.embedded.items, isNotEmpty);
    });
  });
}

void printException(Object e) {
  ApiException apiException = e as ApiException;
  print(
      "message: ${apiException.message}, error: ${apiException.errorResponse?.toJson()}");
}
