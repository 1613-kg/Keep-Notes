import 'package:flutter/material.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/providers/db.dart';
import 'package:notes/screens/home_screen.dart';

import '../models/colors.dart';

class EditNoteScreen extends StatefulWidget {
  static const routeName = '/editNoteScreen';
  MyNotes note;
  EditNoteScreen(this.note);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title.text = widget.note.title.toString();
    content.text = widget.note.content.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        actions: [
          IconButton(
              onPressed: () async {
                await NotesDatabase.instance.updateNote(MyNotes(
                    pin: false,
                    title: title.text,
                    content: content.text,
                    createdTime: DateTime.now(),
                    id: widget.note.id));
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              icon: Icon(
                Icons.save_outlined,
                color: white,
              )),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: title,
              //initialValue: titlePrev,
              cursorColor: white,
              cursorHeight: 25,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8)),
              ),
            ),
            Container(
              height: 300,
              child: TextField(
                controller: content,
                //initialValue: contentPrev,
                minLines: 50,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                cursorColor: white,
                cursorHeight: 25,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Note",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
