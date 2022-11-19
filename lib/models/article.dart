class Article {
  final String title;
  final String byLine;
  final String urlArticle;
  final String imageURL;
  final String dateArticle;
  final String summary;

  Article(this.title, this.byLine, this.urlArticle, this.imageURL,
      this.dateArticle, this.summary);

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      map['title'] as String,
      map['byline'] as String,
      map['url'] as String,
      ['multimedia'].isNotEmpty
          ? map['multimedia'][1]['url']
          : 'https://static01.nyt.com/images/2022/11/14/business/tesla-self-driving-flaws-promo/tesla-self-driving-flaws-promo-superJumbo.jpg',
      map['updated_date'] as String,
      map['abstract'] as String,
    );
  }

  // factory Article.fromJson(String source) =>
  //     Article.fromMap(json.decode(source) as Map<String, dynamic>);
}
