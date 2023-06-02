import 'package:flutter/material.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/screens/home_screen.dart';

import '../models/colors.dart';
import '../providers/db.dart';
import 'edit_note_screen.dart';

class OnTap extends StatefulWidget {
  static const routeName = '/onTap';
  MyNotes note;
  bool isGridView;
  OnTap(this.note, this.isGridView);

  @override
  State<OnTap> createState() => _OnTapState();
}

class _OnTapState extends State<OnTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditNoteScreen(widget.note, widget.isGridView)));
            },
            icon: Icon(
              Icons.edit,
              size: 25,
              color: white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.pinNote(widget.note);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName,
                  arguments: {
                    "isGridView": widget.isGridView,
                  });
            },
            icon: Icon(
                widget.note.pin ? Icons.push_pin : Icons.push_pin_outlined),
          ),
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.archiveNote(widget.note);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName,
                  arguments: {
                    "isGridView": widget.isGridView,
                  });
            },
            icon: Icon(
                widget.note.isArchive ? Icons.archive : Icons.archive_outlined),
          ),
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.deleteNote(widget.note);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName,
                  arguments: {
                    "isGridView": widget.isGridView,
                  });
            },
            icon: Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.note!.title,
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.note!.content,
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
