import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'snackbar_bloclistener_event.dart';
part 'snackbar_bloclistener_state.dart';

class SnackbarBloclistenerBloc
    extends Bloc<SnackbarBloclistenerEvent, SnackbarBloclistenerState> {
  SnackbarBloclistenerBloc() : super(SnackbarBloclistenerInitial()) {
    on<SnackbarBloclistenerEvent>((event, emit) async {
      emit(SnackbarBloclistenerLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(SnackbarBloclistenerSuccess());
    });
  }
}


