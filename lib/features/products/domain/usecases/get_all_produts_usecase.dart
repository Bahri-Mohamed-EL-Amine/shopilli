import 'package:dartz/dartz.dart';
import 'package:shopilli/features/products/domain/repositories/products_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/porduct.dart';

class GetAllProductsUsecase {
  ProdcutsRepository prodcutsRepository;
  GetAllProductsUsecase({required this.prodcutsRepository});
  Future<Either<Failure, List<Product>>> call() async {
    return await prodcutsRepository.getAllProducts();
  }
}
