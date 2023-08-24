import 'package:dartz/dartz.dart';
import 'package:shopilli/features/products/domain/entities/porduct.dart';

import '../../../../core/errors/failures.dart';

abstract class ProdcutsRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
}
