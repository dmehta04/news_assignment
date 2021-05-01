class ArticleEntity {
  final String title;
  final DateTime publishedAt;
  final String url;
  final String urlToImage;
  final String description;

  ArticleEntity({
    required this.title,
    required this.publishedAt,
    required this.description,
    required this.url,
    required this.urlToImage,
  });
}
