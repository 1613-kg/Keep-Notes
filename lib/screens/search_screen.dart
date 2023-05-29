import 'package:flutter/material.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/screens/loading_screen.dart';
import 'package:notes/widgets/loading.dart';
import 'package:notes/widgets/notes_view.dart';

import '../models/colors.dart';
import '../providers/db.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/searchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<MyNotes> SearchResultNotes = [];

  bool isLoading = false;

  void SearchResults(String query) async {
    SearchResultNotes.clear();
    setState(() {
      isLoading = true;
    });
    final ResultIds =
        await NotesDatabase.instance.getNoteString(query); //= [1,2,3,4,5]
    List<MyNotes?> SearchResultNotesLocal = []; //[nOTE1, nOTE2]
    ResultIds.forEach((element) async {
      final SearchNote = await NotesDatabase.instance.getOneNote(element);
      SearchResultNotesLocal.add(SearchNote);
      setState(() {
        SearchResultNotes.add(SearchNote!);
      });
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
            decoration: BoxDecoration(color: white.withOpacity(0.1)),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      color: white,
                    ),
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Search Your Notes",
                          hintStyle: TextStyle(
                              color: white.withOpacity(0.5), fontSize: 16),
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            SearchResults(value.toLowerCase());
                          });
                        },
                      ),
                    ),
                  ],
                ),
                isLoading ? Loading() : NotesView(SearchResultNotes),
              ],
            ),
          )),
        ));
  }
}
