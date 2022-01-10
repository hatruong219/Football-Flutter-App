import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/News/news_all.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:flutter_app_demo/consts.dart';
import 'package:intl/intl.dart';

class SecondaryCard extends StatelessWidget {
  final News news;

  const SecondaryCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: color_grey_3, width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            width: 99.0,
            height: 135.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(linkImageApi+news.image),
                fit: BoxFit.cover,
              )

            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: color_black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0,),
                  Text(
                    news.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: color_grey_2,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        DateFormat.MMMd().format(DateTime.parse(news.time)),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: color_grey_2,
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      const CircleAvatar(
                        radius: 5.0,
                        backgroundColor: color_grey_1,
                      ),
                      const SizedBox(width: 10.0,),
                      Text(
                        "${news.estimate} reads",
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: color_grey_2,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
