import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsFeedPage extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final DateTime? publishedDate;

  NewsFeedPage({this.title, this.imageUrl, this.publishedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
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
                        image: NetworkImage(
                          "https://static.toiimg.com/thumb/msid-82289682,width-1070,height-580,imgsize-495373,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DRDO conducts maiden trial of Python-5 air to air missile - Times of India",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMd().format(DateTime.now()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

// ListTile(
//               leading: Image.network(
//                 "https://static.toiimg.com/thumb/msid-82289682,width-1070,height-580,imgsize-495373,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
//               ),
//               title: Text(
//                 "DRDO conducts maiden trial of Python-5 air to air missile - Times of India",
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   DateFormat.yMMMd().format(DateTime.now()),
//                 ),
//               ),
//               onTap: () {
//                 Navigator.pushNamed(context, "/articleDisplay");
//               });
