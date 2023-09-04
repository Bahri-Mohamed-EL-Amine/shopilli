import 'package:dio/dio.dart';
import 'package:shopilli/core/constants/app_strings.dart';
import 'package:shopilli/core/errors/exceptions.dart';
import 'package:shopilli/core/network/network_info.dart';
import 'package:shopilli/features/categories/data/models/categoy_model.dart';
import 'package:shopilli/features/categories/domain/entities/category.dart';

class CategoriesRemoteDataSource {
  Dio dio;
  NetworkInfo networkInfo;
  CategoriesRemoteDataSource({required this.dio, required this.networkInfo});

  Future<List<MyCategory>> getCategories() async {
    if (await networkInfo.isConnected) {
      Response response = await dio.get('$baseUrl/products/categories');
      if (response.statusCode == 200) {
        final categories = response.data
            .map<MyCategory>((e) => CategoryModel.fromJson(e))
            .toList();
        return categories;
      } else {
        throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
