import 'package:flutter/material.dart';
import 'package:notes/providers/db.dart';
import 'package:notes/screens/write_note_screen.dart';
import 'package:notes/widgets/loading.dart';
import 'package:notes/widgets/notes_view_list.dart';

import '../widgets/longPressedView.dart';
import '../widgets/notes_view.dart';
import '/models/notes_model.dart';
import '/widgets/search_bar.dart';
import '../models/colors.dart';
import 'side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<MyNotes> notesList = [];
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNotes();
  }

  Future getAllNotes() async {
    this.notesList = await NotesDatabase.instance.getAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    bool isGridView = true;
    bool isPressed = false;
    // setState(() {
    //   bool pressed = ModalRoute.of(context)?.settings.arguments as bool;
    //   isPressed = pressed;
    // });
    return (isLoading)
        ? Loading()
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, WriteNote.routeName);
              },
              child: Icon(
                Icons.add,
                size: 40,
                color: white,
              ),
              backgroundColor: black,
            ),
            key: _drawerkey,
            drawer: SideMenu(),
            endDrawerEnableOpenDragGesture: true,
            backgroundColor: bgColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      (isPressed)
                          ? LongPressed()
                          : SearchBox(
                              _drawerkey,
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      (isGridView)
                          ? NotesView(notesList)
                          : NotesViewList(notesList),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
