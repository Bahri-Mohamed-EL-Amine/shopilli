part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationTriggeredEvent extends NavigationEvent {
  final int index;
  const NavigationTriggeredEvent({required this.index});
  @override
  List<Object> get props => [index];
}
