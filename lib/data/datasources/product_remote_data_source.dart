import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      // Simulating API call with mockup data
      final jsonString = await rootBundle.loadString('assets/mockup/products.json');
      final jsonData = json.decode(jsonString);
      final List<dynamic> productsJson = jsonData['data'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      // Simulating API call with mockup data
      final jsonString = await rootBundle.loadString('assets/mockup/products.json');
      final jsonData = json.decode(jsonString);
      final List<dynamic> productsJson = jsonData['data'];
      final productJson = productsJson.firstWhere(
        (product) => product['id'] == id,
        orElse: () => throw Exception('Product not found'),
      );
      return ProductModel.fromJson(productJson);
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }
}
