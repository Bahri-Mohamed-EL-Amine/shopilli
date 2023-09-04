import '../entities/cart_item.dart';
import '../repositories/products_repository.dart';

class RemoveProductUsecase {
  final ProdcutsRepository productsRepository;
  RemoveProductUsecase({required this.productsRepository});
  call(CartItem cartItem) {
    return productsRepository.removeFromCart(cartItem);
  }
}
