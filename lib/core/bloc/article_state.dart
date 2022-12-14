// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitialState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {}

class ArticleErrorLoadingState extends ArticleState {}
