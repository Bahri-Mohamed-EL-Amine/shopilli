part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartAddProductEvent extends CartEvent {
  final CartItem product;
  const CartAddProductEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class CartRemoveProductEvent extends CartEvent {
  final CartItem cartItem;
  const CartRemoveProductEvent({required this.cartItem});
  @override
  List<Object> get props => [cartItem];
}

class CartGetAllEvent extends CartEvent {}
