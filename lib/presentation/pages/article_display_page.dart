import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDisplayPage extends StatelessWidget {
  const ArticleDisplayPage({Key? key}) : super(key: key);
  static const _url =
      "https://pitchfork.com/news/billie-eilish-announces-new-album-happier-than-ever/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.network(
                  "https://images.livemint.com/img/2021/04/28/600x338/Goa_CM_1619597866790_1619597872625.jpg",
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "DRDO conducts maiden trial of Python-5 air to air missile - Times of India",
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "India News: HYDERABAD: India's indigenous Light Combat Aircraft, Tejas, has added the 5th generation Python-5 Air-to-Air Missile (AAM) in its air-to-air weapons c.",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ],
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

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw "Could Not Launch Url $_url";
}
