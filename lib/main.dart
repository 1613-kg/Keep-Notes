import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes/screens/edit_note_screen.dart';
import 'package:notes/screens/login_screen.dart';
import 'package:notes/screens/search_screen.dart';
import 'package:notes/screens/write_note_screen.dart';

import 'screens/home_screen.dart';
import 'screens/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        Login.routeName: (ctx) => Login(),
      },
    );
  }
}
