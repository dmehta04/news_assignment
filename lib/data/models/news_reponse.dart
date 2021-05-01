// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:news_app/domain/entities/article_entity.dart';

NewsResponse newsResponseFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article extends ArticleEntity {
  Article({
    this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  }) : super(
          description: description,
          title: title,
          publishedAt: publishedAt,
          url: url,
          urlToImage: urlToImage,
        );

  Source? source;
  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] ?? '',
        url: json["url"] ?? 'https://google.com',
        urlToImage: json["urlToImage"] != null && json['urlToImage'].isNotEmpty
            ? json["urlToImage"].contains('http://')
                ? 'https://images.ctfassets.net/mk9nps9h607g/5DnT6NoTCguwc4egkiGcIg/b3f22bef3f59efa5b8711c8268cde80a/news-placeholder.jpg'
                : json['urlToImage']
            : 'https://images.ctfassets.net/mk9nps9h607g/5DnT6NoTCguwc4egkiGcIg/b3f22bef3f59efa5b8711c8268cde80a/news-placeholder.jpg',
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        'source': source!.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
