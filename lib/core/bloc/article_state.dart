// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitialState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  List<Article> loadedArticle;
  ArticleLoadedState({
    required this.loadedArticle,
  });
}

class ArticleErrorLoadingState extends ArticleState {}
