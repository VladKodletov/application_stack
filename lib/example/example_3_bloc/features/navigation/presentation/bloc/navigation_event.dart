part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationPage1 extends NavigationEvent {}

class NavigationPage2 extends NavigationEvent {}
