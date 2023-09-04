import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cart_item.dart';
import '../repositories/products_repository.dart';

class GetCartProducstUsecase {
  ProdcutsRepository prodcutsRepository;
  GetCartProducstUsecase({required this.prodcutsRepository});
  Future<Either<Failure, List<CartItem>>> call() async {
    return await prodcutsRepository.getCartProduts();
  }
}
