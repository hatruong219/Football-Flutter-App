import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/detail_main_screen.dart';
import 'package:flutter_app_demo/icon/app_icon_custom_icons.dart';
import 'package:intl/intl.dart';

class InfoMatchTab extends StatelessWidget {
  final OneMatch oneMatch;
  const InfoMatchTab({Key? key, required this.oneMatch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dateTemp = oneMatch.date.toString();
    String dateWithT = dateTemp.substring(0, 8) + 'T' + dateTemp.substring(8);
    DateTime dateMatch = DateTime.parse(dateWithT);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border:const  Border(
              top: BorderSide(width: 1.0, color: Colors.blueGrey),
              bottom: BorderSide(width: 1.0, color: Colors.blueGrey),
              left: BorderSide(width: 1.0, color: Colors.blueGrey),
              right: BorderSide(width: 1.0, color: Colors.blueGrey),

            ),
            borderRadius: BorderRadius.circular(10),


          ),
          child: Column(
                children: [
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                          AppIconCustom.stadium_football,
                        size: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        oneMatch.svd.toString().length<25?
                        oneMatch.svd.toString():oneMatch.svd.toString().substring(0, 25) + '...',
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                            AppIconCustom.calendar_page_svgrepo_com,
                          size: 20,),
                        onPressed: (){},
                      ),
                      Text(
                        DateFormat.yMMMd().format(dateMatch),
                        style: const TextStyle(
                            fontSize: 15
                        ),
                      ),
                      const SizedBox(width: 15,),
                      IconButton(
                        icon: const Icon(AppIconCustom.whistle,
                          size: 18,
                          color: Colors.black,
                        ),
                        onPressed: (){},
                      ),
                      Text(
                          oneMatch.referee.toString(),
                        style: const TextStyle(
                            fontSize: 15
                        ),
                      )
                    ],
                  )
                ],
              )

          ),

      ],
    );
  }
}
