import 'package:news_app/domain/entities/article_entity.dart';

abstract class NewsRepo {
  Future<List<ArticleEntity>> fetchTopArticles(int pageNo, int pageSize);
}
