part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

final class NavigationStoreState extends NavigationState {}

final class NavigationCategoriesState extends NavigationState {}

final class NavigationCartState extends NavigationState {}

final class NavigationProfileState extends NavigationState {}
