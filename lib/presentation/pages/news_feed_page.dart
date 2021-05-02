import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/pages/notifiers/article_notifier.dart';
import 'package:provider/provider.dart';

class NewsFeedPage extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final DateTime? publishedDate;

  NewsFeedPage({this.title, this.imageUrl, this.publishedDate});

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  bool isFetched = false;
  ScrollController _scrollController = ScrollController();
  int pageNo = 1;
  @override
  void initState() {
    ArticleNotifier articleNotifier = context.read<ArticleNotifier>();
    articleNotifier.fetchArticle(pageNo);
    _scrollController.addListener(() {
      if ((_scrollController.offset >
              _scrollController.position.maxScrollExtent - 200) &&
          !isFetched) {
        if (articleNotifier.list!.length < pageNo * 10) {
        } else {
          isFetched = true;
          pageNo = pageNo + 1;
          articleNotifier.fetchArticle(pageNo);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body:
          Consumer<ArticleNotifier>(builder: (context, artilceNotifier, child) {
        if (artilceNotifier.list!.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        isFetched = false;
        return RefreshIndicator(
          onRefresh: () async => artilceNotifier.fetchArticle(1),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: artilceNotifier.list!.length,
                  itemBuilder: (context, index) {
                    ArticleEntity ae = artilceNotifier.list![index];
                    return InkWell(
                      onTap: () {
                        artilceNotifier.selectedArticle = ae;
                        Navigator.pushNamed(context, "/articleDisplay");
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 90,
                        width: 100,
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1 / 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(ae.urlToImage),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ae.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      DateFormat.yMMMd().format(ae.publishedAt),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (artilceNotifier.isLoading)
                Center(child: CircularProgressIndicator())
            ],
          ),
        );
      }),
    );
  }
}
