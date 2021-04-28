import 'dart:convert';

import 'package:news_app/data/models/news_reponse.dart';
import 'package:http/http.dart' as http;

class RemoteAPI {
  Future<List<Article>> fetchTopHeadlines(int pageNo, int pageSize) async {
    http.Response newsResponse = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&page=$pageNo&pageSize=$pageSize&apiKey=853c6bfee9b941108e226d812379f2fa'));

    NewsResponse response =
        NewsResponse.fromJson(json.decode(newsResponse.body));
    return response.articles!;
  }
}
