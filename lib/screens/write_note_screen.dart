import 'package:flutter/material.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/providers/db.dart';
import 'package:notes/screens/home_screen.dart';

import '../models/colors.dart';

class WriteNote extends StatefulWidget {
  static const routeName = '/WriteNote';
  const WriteNote({super.key});

  @override
  State<WriteNote> createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        actions: [
          IconButton(
              onPressed: () async {
                await NotesDatabase.instance.insertNote(
                  MyNotes(
                      pin: false,
                      title: title.text,
                      content: content.text,
                      createdTime: DateTime.now()),
                );
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
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8)),
              ),
            ),
            Container(
              height: 300,
              child: TextField(
                minLines: 50,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: content,
                cursorColor: white,
                cursorHeight: 25,
                style: TextStyle(
                  fontSize: 25,
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
                      fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
