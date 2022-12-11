import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationPage1State()) {
    on<NavigationPage1>((event, emit) {
      emit(NavigationPage1State());
    });
    on<NavigationPage2>((event, emit) {
      emit(NavigationPage2State());
    });
  }
}
