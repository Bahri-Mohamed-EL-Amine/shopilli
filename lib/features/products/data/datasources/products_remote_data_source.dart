import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopilli/core/constants/app_strings.dart';
import 'package:shopilli/core/errors/exceptions.dart';
import 'package:shopilli/features/products/data/models/product_model.dart';

import '../../domain/entities/porduct.dart';

class ProductsRemoteDataSource {
  Dio dio;
  ProductsRemoteDataSource({required this.dio});
  Future<List<Product>> getProducts() async {
    final response = await dio.get('$baseUrl/products');
    if (response.statusCode == 200) {
      final jsons = response.data['products'];
      final products =
          jsons.map<Product>((e) => ProductModel.fromJson(e)).toList();
      return products;
    } else {
      throw ServerException();
    }
  }
}
