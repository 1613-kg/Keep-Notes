import 'package:flutter/material.dart';
import 'package:notes/screens/edit_note_screen.dart';
import 'package:notes/screens/search_screen.dart';
import 'package:notes/screens/write_note_screen.dart';

import 'screens/home_screen.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep Notes',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        WriteNote.routeName: (ctx) => WriteNote(),
        //EditNoteScreen.routeName: (ctx) => EditNoteScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
      },
    );
  }
}
