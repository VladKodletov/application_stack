import 'dart:convert';
import 'package:application_websocket/models/article.dart';
import 'package:http/http.dart' as http;

class APIService {
  // TODO maybe - https://api.nytimes.com/svc/topstories/v2
  final String _defaultURL = 'api.nytimes.com';
  static const String apiKey = 'RtVxnKlT19s7rXE4HG6KTwMFzR13uqVL';

  Future<List<Article>> getArticlesSection(String section) async {
    Map<String, String> parameters = {
      'api-key': apiKey,
    };
    Uri uri = Uri.https(
        _defaultURL, '/svc/topstories/v2/$section.json', parameters);
    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = jsonDecode(response.body);
      List<Article> articles = [];
      data['results'].forEach(
        (articleMap) => articles.add(Article.fromMap(articleMap)),
      );
      return articles;
    } catch (error) {
      throw error.toString();
    }
  }
}
