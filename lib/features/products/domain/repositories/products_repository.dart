import 'package:dartz/dartz.dart';
import 'package:shopilli/features/products/domain/entities/porduct.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cart_item.dart';

abstract class ProdcutsRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<CartItem>>> getCartProduts();
  Future<Either<Failure, Unit>> addToCart(CartItem product);
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category);
  Future<Either<Failure, Unit>> removeFromCart(CartItem cartItem);
}
