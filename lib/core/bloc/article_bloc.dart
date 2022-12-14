import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:application_websocket/core/api/article_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;
  final String section;
  ArticleBloc(this.articleRepository, this.section)
      : super(ArticleInitialState()) {
    on<ArticleSectionChangeEvent>((event, emit) async {
      emit(ArticleLoadingState());

      try {
        emit(
          ArticleLoadedState(),
        );
      } catch (_) {
        emit(ArticleErrorLoadingState());
      }
    });
  }
}
