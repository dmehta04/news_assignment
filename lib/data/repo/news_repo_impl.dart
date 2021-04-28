import 'package:news_app/data/datasources/remote_api.dart';
import 'package:news_app/data/models/news_reponse.dart';
import 'package:news_app/domain/repo/news_repo.dart';

class NewsRepoImpl extends NewsRepo {
  RemoteAPI remoteAPI = RemoteAPI();
  @override
  Future<List<Article>> fetchTopArticles(int pageNo, int pageSize) async {
    return await remoteAPI.fetchTopHeadlines(pageNo, pageSize);
  }
}
