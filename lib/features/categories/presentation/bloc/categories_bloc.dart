import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopilli/core/errors/failures.dart';
import 'package:shopilli/features/categories/domain/usecases/get_all_categories_usecase.dart';

import '../../domain/entities/category.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetAllCategoriesUsecase getAllCategoriesUsecase;
  CategoriesBloc({required this.getAllCategoriesUsecase})
      : super(CategoriesInitial()) {
    on<CategoriesGetAllEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      final categoriesOrFailure = await getAllCategoriesUsecase();
      categoriesOrFailure.fold(
          (failure) =>
              emit(CategoriesErrorState(message: mapFailureToString(failure))),
          (categories) => emit(CategoriesLoadedState(categories: categories)));
    });
  }
}
