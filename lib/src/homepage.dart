import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:saga/src/epub_view_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  Dio dio = new Dio();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Icon(Icons.keyboard_arrow_left,
                    size: MediaQuery.of(context).size.width * 0.1),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        border: Border.all(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Desvendando \nPrincesas',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            'By Flower Books',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Episodes',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '55',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'View Count',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('220',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rating',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '5.0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red[100],
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Icon(
                                  Icons.share_outlined,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              courseButton(),
              Flexible(
                flex: 2,
                child: commentCard(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: 'Library',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          selectedFontSize: 20,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget courseButton() {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  print(' 1111111111111111111');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EPubViewPage()),
                  );
                },
                child: Text('Summary'),
              ),
              InkWell(
                onTap: () {
                  print(' 222222222222');
                },
                child: Text('Episodes'),
              ),
              InkWell(
                onTap: () {
                  print('review tapppppppppppppp');
                },
                child: Text('Reviews'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commentCard() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        );
      },
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: commentList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.05,
                        minHeight: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.07,
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.025,
                    ),
                    Column(
                      children: [
                        Text(
                          commentList[index]['name'],
                        ),
                        Text(
                          commentList[index]['delay'],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(commentList[index]['review']),
                Text(commentList[index]['comment']),
              ],
            ),
          ),
        );
      },
    );
  }

  dynamic commentList = [
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
    {
      "name": "Carlos Day",
      'delay': '5 days ago',
      'review': 'Love it !!!',
      'comment': 'I have a chance to my knowledge. Thanks'
    },
  ];
}
