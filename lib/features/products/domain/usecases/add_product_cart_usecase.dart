import 'package:shopilli/features/products/domain/repositories/products_repository.dart';

import '../entities/cart_item.dart';

class AddProductCartUsecase {
  ProdcutsRepository prodcutsRepository;
  AddProductCartUsecase({required this.prodcutsRepository});
  call(CartItem product) {
    return prodcutsRepository.addToCart(product);
  }
}
