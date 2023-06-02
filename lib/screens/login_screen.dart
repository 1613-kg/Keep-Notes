import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:notes/providers/firebase_db.dart';
import 'package:notes/providers/login_data.dart';
import 'package:notes/screens/home_screen.dart';

import '../providers/auth.dart';

class Login extends StatefulWidget {
  static const routeName = '/LoginScreen';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login To App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(Buttons.Google, onPressed: () async {
              await signInWithGoogle();
              final User? currentUser = await _auth.currentUser;
              LocalDataSaver.saveLoginData(true);
              LocalDataSaver.saveImg(currentUser!.photoURL.toString());
              LocalDataSaver.saveMail(currentUser.email.toString());
              LocalDataSaver.saveName(currentUser.displayName.toString());
              await FireDB().getAllStoredNotes();
              Navigator.pushReplacementNamed(context, HomeScreen.routeName,
                  arguments: {
                    "isGridView": isGridView,
                  });
            })
          ],
        ),
      ),
    );
  }
}
