part of 'snackbar_bloclistener_bloc.dart';

abstract class SnackbarBloclistenerEvent extends Equatable {
  const SnackbarBloclistenerEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends SnackbarBloclistenerEvent {}
