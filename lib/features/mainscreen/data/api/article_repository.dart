
import 'package:application_websocket/features/mainscreen/data/api/api_service.dart';
import 'package:application_websocket/features/mainscreen/data/models/article.dart';

class ArticleRepository {
  final APIService _articleRepository = APIService();
  late final String section;
  Future<List<Article>> getSectionArticles(section) =>
      _articleRepository.getArticlesSection(section);
}
