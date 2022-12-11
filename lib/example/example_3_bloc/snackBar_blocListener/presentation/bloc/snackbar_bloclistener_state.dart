part of 'snackbar_bloclistener_bloc.dart';

abstract class SnackbarBloclistenerState extends Equatable {
  const SnackbarBloclistenerState();

  @override
  List<Object> get props => [];
}

class SnackbarBloclistenerInitial extends SnackbarBloclistenerState {}

class SnackbarBloclistenerLoading extends SnackbarBloclistenerState {}

class SnackbarBloclistenerSuccess extends SnackbarBloclistenerState {}
