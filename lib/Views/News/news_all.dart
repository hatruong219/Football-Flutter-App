import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Models/news_models.dart';
import 'package:flutter_app_demo/Views/News/primary_card.dart';
import 'package:flutter_app_demo/Views/News/read_news_view.dart';
import 'package:flutter_app_demo/Views/News/secondary_card.dart';
import 'package:flutter_app_demo/consts.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:http/http.dart' as http;
import "package:date_format/date_format.dart";
import 'dart:async';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
class News {
  final String title;
  final String description;
  final String content;
  final String category;
  final String parentCategory;
  final String time;
  final String author;
  final String image;
  final String estimate;

  News(this.title, this.description, this.content, this.category,
      this.parentCategory, this.time, this.author, this.image, this.estimate);
}


class AllNews extends StatelessWidget {
  Future<List<News>> getTopArticles() async {
    var response = await http.get(Uri.parse(
        '$linkApi/api/articles/list/top-articles'
    ));
    var jonDataTemp = jsonDecode(response.body);
    List<News> listArticles = [];
    for(var one in jonDataTemp){
      News temp = News(
        one["title"].toString(),
        one["description"].toString(),
        one["content"].toString(),
        one["category"].toString(),
        one["parentCategory"].toString(),
        one["time"].toString(),
        one["author"].toString(),
        one["image"].toString(),
        one["estimate"].toString(),
      );
      listArticles.add(temp);
    }
    return listArticles;
  }

  Future<List<News>> getBaseArticles() async {
    var response = await http.get(Uri.parse(
        '$linkApi/api/articles/list/base-articles'
    ));
    var jonDataTemp = jsonDecode(response.body);
    List<News> listArticles = [];
    for(var one in jonDataTemp){
      News temp = News(
        one["title"].toString(),
        one["description"].toString(),
        one["content"].toString(),
        one["category"].toString(),
        one["parentCategory"].toString(),
        one["time"].toString(),
        one["author"].toString(),
        one["image"].toString(),
        one["estimate"].toString(),
      );
      listArticles.add(temp);
    }
    return listArticles;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.only(left: 18.0),
            child: FutureBuilder(
              future: getTopArticles(),
                builder: (BuildContext context, AsyncSnapshot topSnap){
                  if (topSnap.data == null) {
                    return const Center(
                      child: Text(
                          '...'
                      ),
                    );
                  }else{
                    return ListView.builder(
                        itemCount: topSnap.data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index){
                          var news = topSnap.data[index];
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ReadNewsView(news: news),));
                              },
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: PrimaryCard(news: news,),
                            ),
                          );
                        }
                    );
                  }
                }
            ),
          ),
          const SizedBox(height: 25,),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.0),
              child: Text(
                "BASE ON YOUR READING HISTORY",
                style: TextStyle(
                  fontSize: 16.0,
                  color: color_black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FutureBuilder(
              future: getBaseArticles(),
              builder: (BuildContext context, AsyncSnapshot baseSnap){
                if (baseSnap.data == null) {
                  return const Center(
                    child: Text(
                        '...'
                    ),
                  );
                }else{
                  return ListView.builder(
                      itemCount: baseSnap.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, index){
                        var news = baseSnap.data[index];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ReadNewsView(news: news),));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 135.0,
                            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                            child: SecondaryCard(news: news,),
                          ),
                        );
                      }
                  );
                }
              }
          ),
        ],
      ),
    );
    // return Container(
    //   child: ListView(
    //     children: [
    //       Container(
    //         width: double.infinity,
    //         height: 300.0,
    //         padding: const EdgeInsets.only(left: 18.0),
    //         child: ListView.builder(
    //           itemCount: news_list.length,
    //           scrollDirection: Axis.horizontal,
    //           shrinkWrap: true,
    //           itemBuilder: (BuildContext context, index){
    //             var news = news_list[index];
    //             return InkWell(
    //               onTap: (){
    //                 Navigator.push(context, MaterialPageRoute(builder: (context) => ReadNewsView(news: news),));
    //               },
    //               child: Container(
    //                 margin: const EdgeInsets.only(right: 12),
    //                 child: PrimaryCard(news: news,),
    //               ),
    //             );
    //
    //           },
    //
    //         ),
    //       ),
    //
    //       const SizedBox(height: 25,),
    //       const Align(
    //         alignment: Alignment.topLeft,
    //         child: Padding(
    //           padding: EdgeInsets.only(left: 19.0),
    //           child: Text(
    //             "BASE ON YOUR READING HISTORY",
    //             style: TextStyle(
    //               fontSize: 16.0,
    //               color: color_black,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //       ),
    //       ListView.builder(
    //
    //         itemCount: recentList.length,
    //         scrollDirection: Axis.vertical,
    //         shrinkWrap: true,
    //         physics: ScrollPhysics(),
    //         itemBuilder: (BuildContext context, index){
    //           var recent = recentList[index];
    //           return InkWell(
    //             onTap: (){
    //               Navigator.push(
    //                   context,
    //                 MaterialPageRoute(builder: (context) => ReadNewsView(news: recent),),
    //               );
    //             },
    //             child: Container(
    //               width: double.infinity,
    //               height: 135.0,
    //               margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
    //               child: SecondaryCard(news: recent,),
    //             ),
    //           );
    //         }
    //       )
    //     ],
    //   ),
    // );
  }
}
