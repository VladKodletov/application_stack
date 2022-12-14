// part of 'articles_bloc.dart';

// enum ArticlesStatus { initial, success, failure }

// class ArticlesState extends Equatable {
//   final ArticlesStatus status;
//   final List<Article> articles;
//   final String nameSection;

//   const ArticlesState(
//       {this.status = ArticlesStatus.initial,
//       this.articles = const <Article>[],
//       this.nameSection = 'home'});

//   ArticlesState copyWith({
//     ArticlesStatus? status,
//     List<Article>? articles,
//     String? nameSection,
//   }) {
//     return ArticlesState(
//       status: status ?? this.status,
//       articles: articles ?? this.articles,
//       nameSection: nameSection ?? this.nameSection,
//     );
//   }

//   @override
//   String toString() {
//     return '''ArticlesState { status: $status, articles: $articles, nameSection: $nameSection }''';
//   }

//   @override

//   List<Object?> get props => [status, articles, nameSection];
// }

part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {
  final String section;

  const ArticlesInitial({required this.section});
}

class ArticlesLoading extends ArticlesState {}

class ArticlesSuccess extends ArticlesState {}

class ArticlesFailure extends ArticlesState {}
