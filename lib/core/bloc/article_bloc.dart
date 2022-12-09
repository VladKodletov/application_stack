import 'package:application_websocket/core/api/article_repository.dart';
import 'package:application_websocket/core/models/article.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
        final List<Article> loadedArticle =
            await articleRepository.getSectionArticles(section);
        emit(
          ArticleLoadedState(loadedArticle: loadedArticle),
        );
      } catch (_) {
        emit(ArticleErrorLoadingState());
      }
    });
  }
}
