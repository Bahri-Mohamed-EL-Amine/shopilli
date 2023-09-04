import 'package:dartz/dartz.dart';
import 'package:shopilli/core/errors/failures.dart';
import 'package:shopilli/features/categories/domain/entities/category.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<MyCategory>>> getAllCategories();
}
