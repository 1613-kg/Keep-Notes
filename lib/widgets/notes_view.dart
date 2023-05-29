import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/screens/home_screen.dart';

import '../models/colors.dart';
import '../models/notes_model.dart';
import '../screens/edit_note_screen.dart';

class NotesView extends StatefulWidget {
  List<MyNotes> notesList;
  NotesView(this.notesList);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  bool isPressed = false;
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
            child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.notesList.length,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditNoteScreen(widget.notesList[index])));
                      },
                      onLongPress: () {
                        setState(() {
                          isPressed = true;
                          Navigator.pushNamed(context, HomeScreen.routeName,
                              arguments: {isPressed});
                        });
                      },
                      child: Container(
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
