import 'package:flutter/material.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/screens/search_screen.dart';

import '../models/colors.dart';

class SearchBox extends StatefulWidget {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  SearchBox(this.drawerKey);

  @override
  State<SearchBox> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBox> {
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: 55,
            decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3)
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.drawerKey.currentState!.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: white,
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SearchScreen.routeName);
                        },
                        child: Container(
                            height: 55,
                            width: 150,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Search Your Notes",
                                    style: TextStyle(
                                        color: white.withOpacity(0.5),
                                        fontSize: 16),
                                  )
                                ])),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        (isGridView)
                            ? TextButton(
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => white.withOpacity(0.1)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ))),
                                onPressed: () {
                                  // setState(() {
                                  isGridView = false;
                                  Navigator.pushReplacementNamed(
                                      context, HomeScreen.routeName,
                                      arguments: {
                                        isGridView,
                                      });
                                  //});
                                },
                                child: Icon(
                                  Icons.grid_view,
                                  color: white,
                                ),
                              )
                            : TextButton(
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => white.withOpacity(0.1)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ))),
                                onPressed: () {
                                  //setState(() {
                                  isGridView = true;
                                  Navigator.pushReplacementNamed(
                                      context, HomeScreen.routeName,
                                      arguments: {
                                        isGridView,
                                      });
                                  //});
                                },
                                child: Icon(
                                  Icons.list_alt_outlined,
                                  color: white,
                                ),
                              ),
                        SizedBox(
                          width: 9,
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ])),
      ],
    );
  }
}
