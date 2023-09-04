import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopilli/core/errors/failures.dart';
import 'package:shopilli/features/products/domain/usecases/add_product_cart_usecase.dart';
import 'package:shopilli/features/products/domain/usecases/get_cart_products_usecase.dart';

import '../../../domain/entities/cart_item.dart';
import '../../../domain/usecases/remove_product_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartProducstUsecase getCartProducstUsecase;
  AddProductCartUsecase addProductCartUsecase;
  RemoveProductUsecase removeProductUsecase;
  CartBloc(
      {required this.getCartProducstUsecase,
      required this.addProductCartUsecase,
      required this.removeProductUsecase})
      : super(CartInitialState()) {
    on<CartGetAllEvent>((event, emit) async {
      emit(CartLoadingState());
      final failureOrProducts = await getCartProducstUsecase();
      failureOrProducts.fold(
        (failure) => emit(
          CartErrorState(message: mapFailureToString(failure)),
        ),
        (products) => emit(CartLoadedState(products: products)),
      );
    });
    on<CartAddProductEvent>((event, emit) async {
      emit(CartLoadingState());
      final failureOrProducts = await addProductCartUsecase(event.product);
      failureOrProducts.fold(
        (failure) => emit(
          CartErrorState(message: mapFailureToString(failure)),
        ),
        (succes) => null,
      );
    });
    on<CartRemoveProductEvent>((event, emit) async {
      emit(CartLoadingState());
      final failureOrUnit = await removeProductUsecase(event.cartItem);
      failureOrUnit.fold(
        (failure) => emit(
          CartErrorState(message: mapFailureToString(failure)),
        ),
        (succes) => null,
      );
    });
  }
}
