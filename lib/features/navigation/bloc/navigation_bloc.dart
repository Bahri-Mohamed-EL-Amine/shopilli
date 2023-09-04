import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationStoreState()) {
    on<NavigationTriggeredEvent>((event, emit) {
      switch (event.index) {
        case 0:
          emit(NavigationStoreState());
          break;
        case 1:
          emit(NavigationCategoriesState());
          break;
        case 2:
          emit(NavigationCartState());
          break;
        case 3:
          emit(NavigationProfileState());
          break;
        default:
          break;
      }
    });
  }
}
