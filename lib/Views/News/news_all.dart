import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Models/news_models.dart';
import 'package:flutter_app_demo/Views/News/primary_card.dart';
import 'package:flutter_app_demo/consts.dart';

class AllNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300.0,
            padding: EdgeInsets.only(left: 18.0),
            child: ListView.builder(
              itemCount: news_list.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index){
                var news = news_list[index];
                return InkWell(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    child: PrimaryCard(news: news,),
                  ),
                );

              },

            ),
          ),

          SizedBox(height: 25,),
          Align(
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
          ListView.builder(

            itemCount: recentList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, index){
              var recent = recentList[index];
              return InkWell(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 135.0,
                  margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: SecondaryCard(),
                ),
              )
            }
          )
        ],
      ),
    );
  }
}
