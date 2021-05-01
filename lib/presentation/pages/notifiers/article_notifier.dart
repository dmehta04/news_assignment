import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/fetch_article_usecase.dart';

class ArticleNotifier extends ChangeNotifier {
  List<ArticleEntity>? list = [];
  ArticleEntity? selectedArticle;
  bool isLoading = false;

  void fetchArticle(int pageNo) async {
    isLoading = true;
    if (pageNo != 1) {
      notifyListeners();
    }
    FetchArticleUsecase usecase = FetchArticleUsecase();
    list!.addAll(await usecase.execute(pageNo));
    isLoading = false;
    notifyListeners();
  }
}
