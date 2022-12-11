part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();
  
  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}
