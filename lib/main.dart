import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/presentation/pages/news_feed_page.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/article_display_page.dart';
import 'presentation/pages/notifiers/article_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticleNotifier(),
      child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/articleDisplay': (BuildContext context) => ArticleDisplayPage(),
          },
          theme: ThemeData.dark(),
          home: NewsFeedPage()),
    );
  }
}
