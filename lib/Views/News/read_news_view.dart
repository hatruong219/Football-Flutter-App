import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/News/news_all.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:flutter_app_demo/consts.dart';
import 'package:intl/intl.dart';

class ReadNewsView extends StatelessWidget {
  final News news;

  ReadNewsView({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            const SizedBox(height: 12.0,),
            Hero(
                tag: "123",
                child: Container(
                  height: 222.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(linkImageApi+news.image),
                      fit: BoxFit.cover,
                    )
                  ),
                )
            ),
            const SizedBox(height: 15.0,),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: color_grey_3, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.timer,
                      ),
                      const SizedBox(width: 5.0,),
                      Text(
                        DateFormat.MMMd().format(DateTime.parse(news.time)),
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: color_grey_2,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                      ),
                      const SizedBox(width: 5.0,),
                      Text(
                        news.author,
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: color_grey_2,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12.0,),
            Text(
              news.title,
              style: const TextStyle(
                  fontSize: 28.0,
                  color: color_black,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 15.0,),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 2,),
                  child: CircleAvatar(
                    radius: 5,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                    "${news.estimate} read",
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: color_grey_2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0,),
            Text(
              news.content,
              style: const TextStyle(
                fontSize: 16.0,
                color: color_black,
                fontWeight: FontWeight.w400,
                height: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
