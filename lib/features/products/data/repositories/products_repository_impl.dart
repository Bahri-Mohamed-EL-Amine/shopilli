import 'package:dartz/dartz.dart';
import 'package:shopilli/core/errors/exceptions.dart';
import 'package:shopilli/core/errors/failures.dart';
import 'package:shopilli/features/products/data/datasources/products_remote_data_source.dart';
import 'package:shopilli/features/products/domain/entities/porduct.dart';
import 'package:shopilli/features/products/domain/repositories/products_repository.dart';

import '../../domain/entities/cart_item.dart';

class ProductsRepositoryImpl extends ProdcutsRepository {
  ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl({required this.productsRemoteDataSource});
  // temp

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final items = await productsRemoteDataSource.getProducts();
      return Right(items);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCartProduts() async {
    try {
      final items = await productsRemoteDataSource.getCartProducst();
      return Right(items);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addToCart(CartItem product) async {
    try {
      await productsRemoteDataSource.addToCart(product);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String category) async {
    try {
      final items =
          await productsRemoteDataSource.getProductsByCategory(category);
      return Right(items);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromCart(CartItem cartItem) async {
    try {
      await productsRemoteDataSource.removeFromCart(cartItem);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }
}
