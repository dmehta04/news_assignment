import 'package:news_app/data/repo/news_repo_impl.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repo/news_repo.dart';

class FetchArticleUsecase {
  NewsRepo newsRepo = NewsRepoImpl();
  Future<List<ArticleEntity>> execute(int pageNo) {
    return newsRepo.fetchTopArticles(pageNo, 10);
  }
}
