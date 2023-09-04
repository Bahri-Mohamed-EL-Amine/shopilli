import 'package:shopilli/features/products/domain/repositories/products_repository.dart';

class GetProductsByCategoryUsecase {
  ProdcutsRepository prodcutsRepository;
  GetProductsByCategoryUsecase({required this.prodcutsRepository});

  call(String category) async {
    return await prodcutsRepository.getProductsByCategory(category);
  }
}
