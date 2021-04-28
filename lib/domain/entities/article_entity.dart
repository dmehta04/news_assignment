class ArticleEntity {
  final String title;
  final DateTime publishedAt;
  final String? url;
  final String? urlToImage;
  final String content;

  ArticleEntity({
    required this.title,
    required this.publishedAt,
    required this.content,
    this.url,
    this.urlToImage,
  });
}
