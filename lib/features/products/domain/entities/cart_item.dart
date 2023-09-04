import 'package:shopilli/features/products/domain/entities/porduct.dart';

class CartItem {
  int quantity;
  final Product product;
  CartItem({required this.product, this.quantity = 1});
}
