import 'dart:convert';
import 'package:application_websocket/features/mainscreen/data/models/article.dart';
import 'package:http/http.dart' as http;

class APIService {
  final String _defaultURL = 'api.nytimes.com';
  static const String apiKey = 'RtVxnKlT19s7rXE4HG6KTwMFzR13uqVL';

  Future<List<Article>> getArticlesSection(String section) async {
    Map<String, String> parameters = {
      'api-key': apiKey,
    };
    Uri uri =
        Uri.https(_defaultURL, '/svc/topstories/v2/$section.json', parameters);
    try {
      List<Article> articles = [];
      var response = await http.get(uri);
      Map<String, dynamic> data = jsonDecode(response.body);

      data['results'].forEach(
        (articleMap) => articles.add(Article.fromMap(articleMap)),
      );
      return articles;
    } catch (error) {
      throw error.toString();
    }
  }
}




//TODO little corrected for bloc
// import 'dart:convert';
// import 'package:application_websocket/core/models/article.dart';
// import 'package:http/http.dart' as http;

// class APIService {
//   final String _defaultURL = 'api.nytimes.com';
//   static const String apiKey = 'RtVxnKlT19s7rXE4HG6KTwMFzR13uqVL';

//   Future<List<Article>> getArticlesSection(String section) async {
//     Map<String, String> parameters = {
//       'api-key': apiKey,
//     };
//     Uri uri =
//         Uri.https(_defaultURL, '/svc/topstories/v2/$section.json', parameters);
//     List<Article> articles = [];
//     var response = await http.get(uri);

//     if (response.statusCode == 200) {
//       try {
//         Map<String, dynamic> data = jsonDecode(response.body);
//         data['results'].forEach(
//           (articleMap) => articles.add(Article.fromMap(articleMap)),
//         );
//         return articles;
//       } catch (error) {
//         throw error.toString();
//       }
//     } else {
//       throw Exception('Error fetching articles');
//     }
//   }
// }
