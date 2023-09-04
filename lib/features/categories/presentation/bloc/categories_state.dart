part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final List<MyCategory> categories;
  const CategoriesLoadedState({required this.categories});
  @override
  List<Object> get props => [categories];
}

class CategoriesErrorState extends CategoriesState {
  final String message;
  const CategoriesErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
