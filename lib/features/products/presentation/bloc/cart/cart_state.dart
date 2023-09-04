part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartItem> products;
  const CartLoadedState({required this.products});
  @override
  List<Object> get props => [products];
}

class CartErrorState extends CartState {
  final String message;
  const CartErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
