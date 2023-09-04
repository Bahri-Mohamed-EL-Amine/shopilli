import 'package:dio/dio.dart';
import 'package:shopilli/core/constants/app_strings.dart';
import 'package:shopilli/core/errors/exceptions.dart';
import 'package:shopilli/features/products/data/models/product_model.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/porduct.dart';
import '../../domain/entities/cart_item.dart';

class ProductsRemoteDataSource {
  Dio dio;
  NetworkInfo networkInfo;
  ProductsRemoteDataSource({required this.dio, required this.networkInfo});
  Future<List<Product>> getProducts() async {
    if (await networkInfo.isConnected) {
      final response = await dio.get('$baseUrl/products');
      if (response.statusCode == 200) {
        final jsons = response.data['products'];
        final products =
            jsons.map<Product>((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }

  List<CartItem> products = [];

  Future<List<CartItem>> getCartProducst() async {
    return products;
  }

  Future<void> removeFromCart(CartItem cartItem) async {
    final existingItemIndex = products
        .indexWhere((element) => element.product.id == cartItem.product.id);
    if (existingItemIndex == -1) return;
    if (products[existingItemIndex].quantity == 1) {
      products.removeAt(existingItemIndex);
    } else {
      products[existingItemIndex].quantity--;
    }
  }

  Future<void> addToCart(CartItem cartItem) async {
    final existingItemIndex = products
        .indexWhere((element) => element.product.id == cartItem.product.id);
    if (existingItemIndex == -1) {
      products.add(cartItem);
    } else {
      products[existingItemIndex].quantity++;
    }
  }

  // filter products by category
  Future<List<Product>> getProductsByCategory(String category) async {
    if (await networkInfo.isConnected) {
      final response = await dio.get('$baseUrl/products/category/$category');
      if (response.statusCode == 200) {
        final jsons = response.data['products'];
        final products =
            jsons.map<Product>((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
