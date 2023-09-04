part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsGetAllEvent extends ProductsEvent {}

class ProductsCategoryEvent extends ProductsEvent {
  final String category;
  const ProductsCategoryEvent({required this.category});
  @override
  List<Object> get props => [category];
}
