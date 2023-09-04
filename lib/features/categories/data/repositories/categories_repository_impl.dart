import 'package:dartz/dartz.dart';
import 'package:shopilli/core/errors/exceptions.dart';
import 'package:shopilli/core/errors/failures.dart';
import 'package:shopilli/core/network/network_info.dart';
import 'package:shopilli/features/categories/data/datasources/remote_data_source.dart';
import 'package:shopilli/features/categories/domain/entities/category.dart';
import 'package:shopilli/features/categories/domain/repositories/categoires_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesRemoteDataSource categoriesRemoteDataSource;
  NetworkInfo networkInfo;
  CategoriesRepositoryImpl(
      {required this.categoriesRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<MyCategory>>> getAllCategories() async {
    try {
      final categories = await categoriesRemoteDataSource.getCategories();
      return Right(categories);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }
}
