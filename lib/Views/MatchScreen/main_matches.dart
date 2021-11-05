import 'package:flutter/material.dart';

class MainMatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index){
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Premire league title
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premier League",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 22,
                        )
                      ],
                    ),
                    // team vs team
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "16:00",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premier League",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 22,
                        )
                      ],
                    ),
                    // team vs team
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "16:00",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premier League",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 22,
                        )
                      ],
                    ),
                    // team vs team
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "16:00",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          // times
                          Expanded(
                            flex: 2,
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),

                            ),
                          ),
                          // team vs team
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                child: Image.asset(
                                                  "assets/images/seria.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                              ,
                                              Text(
                                                "Real Marid",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // space
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                            ),
                          ),
                          // Icon favourites
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.white60,
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}


