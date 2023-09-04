import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopilli/core/errors/failures.dart';
import '../../../domain/usecases/get_all_produts_usecase.dart';

import '../../../domain/entities/porduct.dart';
import '../../../domain/usecases/get_products_by_category_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  GetAllProductsUsecase getAllProductsUsecase;
  GetProductsByCategoryUsecase getProductsByCategoryUsecase;
  ProductsBloc(
      {required this.getAllProductsUsecase,
      required this.getProductsByCategoryUsecase})
      : super(ProductsInitialState()) {
    on<ProductsEvent>((event, emit) async {
      if (event is ProductsGetAllEvent) {
        emit(ProductsLoadingState());
        final failureOrProcducts = await getAllProductsUsecase();
        failureOrProcducts.fold(
          (failure) => emit(
            ProductsErrorState(
              message: mapFailureToString(failure),
            ),
          ),
          (products) => emit(
            ProductsLoadedState(products: products),
          ),
        );
      }
    });
    on<ProductsCategoryEvent>(
        (ProductsCategoryEvent event, Emitter emit) async {
      emit(ProductsLoadingState());
      final failureOrProcducts =
          await getProductsByCategoryUsecase(event.category);
      failureOrProcducts.fold(
        (failure) => emit(
          ProductsErrorState(
            message: mapFailureToString(failure),
          ),
        ),
        (products) => emit(
          ProductsLoadedState(products: products),
        ),
      );
    });
  }
}
