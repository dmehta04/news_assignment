import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/pages/notifiers/article_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class ArticleDisplayPage extends StatefulWidget {
  const ArticleDisplayPage({Key? key}) : super(key: key);

  @override
  _ArticleDisplayPageState createState() => _ArticleDisplayPageState();
}

class _ArticleDisplayPageState extends State<ArticleDisplayPage> {
  ArticleNotifier? articleNotifier;
  ArticleEntity? article;
  @override
  void initState() {
    articleNotifier = context.read<ArticleNotifier>();
    article = articleNotifier!.selectedArticle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              article!.urlToImage,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        article!.title,
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        article!.description,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  onSurface: Colors.black54,
                  primary: Colors.grey,
                  minimumSize: Size(double.infinity, 50)),
              onPressed: _launchURL,
              child: Text("Go to the website for more info"),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(article!.url)
      ? await launch(article!.url)
      : throw "Could Not Launch Url ${article!.url}";
}
