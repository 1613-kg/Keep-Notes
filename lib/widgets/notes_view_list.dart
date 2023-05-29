import 'package:flutter/material.dart';

import '/models/notes_model.dart';
import '../models/colors.dart';

class NotesViewList extends StatefulWidget {
  List<MyNotes> notesList;
  //const NotesViewList({super.key});
  NotesViewList(this.notesList);

  @override
  State<NotesViewList> createState() => _NotesViewListState();
}

class _NotesViewListState extends State<NotesViewList> {
  @override
  Widget build(BuildContext context) {
    int len = widget.notesList.length;
    setState(() {
      len = widget.notesList.length;
    });
    return (len == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.hourglass_empty,
                  size: 40,
                  color: white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("No Notes"),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.notesList.length,
                // mainAxisSpacing: 12,
                // crossAxisSpacing: 12,
                // crossAxisCount: 4,
                // staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: white.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.notesList[index].title,
                                style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.notesList[index].content.length > 250
                                  ? "${widget.notesList[index].content.substring(0, 250)}..."
                                  : widget.notesList[index].content,
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    )));
  }
}
