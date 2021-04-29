import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/presentation/pages/news_feed_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'presentation/pages/article_display_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/articleDisplay': (BuildContext context) => ArticleDisplayPage(),
        },
        theme: ThemeData.dark(),
        home: NewsFeedPage());
  }
}
