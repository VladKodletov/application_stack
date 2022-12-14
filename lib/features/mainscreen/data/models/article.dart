import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String byLine;
  final String urlArticle;
  final String? imageURL;
  final String dateArticle;
  final String summary;
  final String sectionArticle;

  const Article(this.title, this.byLine, this.urlArticle, this.imageURL,
      this.dateArticle, this.summary, this.sectionArticle);

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      map['title'] as String,
      map['byline'] as String,
      map['url'] as String,
      map['multimedia'][1]['url'] ??
          'https://dev.jollibeegroup.com/wp-content/themes/main/assets/img/placeholder/no-image-placeholder.jpg',
      map['published_date'] as String,
      map['abstract'] as String,
      map['section'] as String,
    );
  }

  @override
  List<Object?> get props => [
        title,
        byLine,
        urlArticle,
        imageURL,
        dateArticle,
        summary,
        sectionArticle
      ];
}
