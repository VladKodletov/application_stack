import 'dart:io';

import 'package:application_websocket/core/api/api_service.dart';
import 'package:application_websocket/core/models/article.dart';

class ArticleRepository {
  final APIService _articleRepository = APIService();
  late final String section;
  Future<List<Article>> getSectionArticles(section) =>
      _articleRepository.getArticlesSection(section);
}
