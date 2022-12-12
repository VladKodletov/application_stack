part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationPage1State extends NavigationState {}

class NavigationPage2State extends NavigationState {}
