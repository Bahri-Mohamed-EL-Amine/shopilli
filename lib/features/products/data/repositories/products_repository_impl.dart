import 'package:dartz/dartz.dart';
import 'package:shopilli/core/errors/exceptions.dart';
import 'package:shopilli/core/errors/failures.dart';
import 'package:shopilli/core/network/network_info.dart';
import 'package:shopilli/features/products/data/datasources/products_remote_data_source.dart';
import 'package:shopilli/features/products/domain/entities/porduct.dart';
import 'package:shopilli/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProdcutsRepository {
  ProductsRemoteDataSource productsRemoteDataSource;
  NetworkInfo networkInfo;
  ProductsRepositoryImpl(
      {required this.productsRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await productsRemoteDataSource.getProducts();
        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
