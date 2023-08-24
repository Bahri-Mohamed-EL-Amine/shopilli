import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopilli/core/errors/failures.dart';
import '../../domain/usecases/get_all_produts_usecase.dart';

import '../../domain/entities/porduct.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  GetAllProductsUsecase getAllProductsUsecase;
  ProductsBloc({required this.getAllProductsUsecase})
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
  }
}
