import 'package:dartz/dartz.dart';
import 'package:shopilli/core/errors/failures.dart';
import 'package:shopilli/features/categories/domain/entities/category.dart';
import 'package:shopilli/features/categories/domain/repositories/categoires_repository.dart';

class GetAllCategoriesUsecase {
  CategoriesRepository categoriesRepository;
  GetAllCategoriesUsecase({required this.categoriesRepository});
  Future<Either<Failure, List<MyCategory>>> call() async {
    return await categoriesRepository.getAllCategories();
  }
}
