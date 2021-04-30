import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ur_notes/json/notes_json.dart';
import 'package:ur_notes/theme/colors.dart';
import 'package:ur_notes/widgets/header.dart';

import 'card_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: white,
      drawer: Drawer(),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: bgColor,
        child: Center(
          child: SvgPicture.asset(
            "assets/images/google_icon.svg",
            width: 30,
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(top: 20),
        children: [
          Header(size: size, drawerKey: _drawerKey),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              getGridView()
            ],
          )
        ],
      ),
    );
  }

  Widget getGridView() {
    var size = MediaQuery
        .of(context)
        .size;
    return Column(
        children: List.generate(notes.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (_)
              =>
                  CardDetailPage(
                    title: notes[index]['title'],
                    description: notes[index]['description'],
                  )));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: black.withOpacity(0.1))),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notes[index]['title'],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        notes[index]['description'],
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.7)),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.delete,
                          color: white.withOpacity(0.7),
                          size: 22,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
