class Article {
  final String title;
  final String byLine;
  final String urlArticle;
  final String imageURL;
  final String dateArticle;
  final String summary;
  final String sectionArticle;

  Article(this.title, this.byLine, this.urlArticle, this.imageURL,
      this.dateArticle, this.summary, this.sectionArticle);

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      ['title'].isNotEmpty ? map['title'] as String : "",
      ['byline'].isNotEmpty ? map['byline'] as String : '',
      ['url'].isNotEmpty ? map['url'] as String : '',
      ['multimedia'].isNotEmpty ? map['multimedia'][1]['url'] as String : '',
      ['updated_date'].isNotEmpty ? map['updated_date'] as String : '',
      ['abstract'].isNotEmpty ? map['abstract'] as String : '',
      ['section'].isNotEmpty ? map['section'] as String : '',
    );
  }
}
