import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Models/news_models.dart';
import 'package:flutter_app_demo/consts.dart';

class PrimaryCard extends StatelessWidget {
  final News news;

  PrimaryCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: color_grey_3, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: color_grey_1,
              ),
              SizedBox(width: 10,),
              Text(
                news.category,
                style: TextStyle(
                  fontSize: 14.0,
                  color: color_grey_2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          SizedBox(height: 5.0,),
          Expanded(
            child: Hero(
              tag: news.seen,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(news.image,),
                    fit: BoxFit.cover,
                  ),
                ),
            ),
          ),
      ),
          SizedBox(height: 5,),
          Text(
            news.title,
            style: TextStyle(
              fontSize: 18.0,
              color: color_black,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text(
                news.time,
                style: TextStyle(
                  fontSize: 14.0,
                  color: color_grey_2,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: color_grey_1,
              ),
              SizedBox(width: 10,),
              Text(
                "${news.estimate} min reads",
                style: TextStyle(
                  fontSize: 14.0,
                  color: color_grey_2,
                ),
              )
            ],
          )
        ]
      ),
    );
  }
}
