// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_null_comparison, avoid_print, unused_label

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favNotesModal.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  SharedPreferences? sharedPreferences;

  List<String>? notesTitleList = [];
  List<String>? notesList = [];

  List<String>? favnotesTitleList = [];
  List<String>? favnotesList = [];

  getNotes() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? getNotesTitleList =
        sharedPreferences?.getStringList('notesTitleList');
    notesTitleList = getNotesTitleList!.map((e) => e.toString()).toList();
    setState(() {});

    List<String>? getNotesList = sharedPreferences?.getStringList('notesList');
    notesList = getNotesList!.map((e) => e.toString()).toList();
    setState(() {});
  }

  getFavNotes() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? getFavNotesTitleList =
        sharedPreferences?.getStringList('FavNotesTitleList');
    favnotesTitleList = getFavNotesTitleList!.map((e) => e.toString()).toList();
    setState(() {});

    List<String>? getFavNotesList =
        sharedPreferences?.getStringList('FavNotesDescriptList');
    favnotesList = getFavNotesList!.map((e) => e.toString()).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNotes();
    getFavNotes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notes List Screen"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/fav-notes");
          },
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            notesList == null
                ? Center(
                    child: Text(
                    "No notes available",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ))
                : Expanded(
                    child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: notesTitleList!.length,
                        itemBuilder: (context, index) => Column(children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Text(notesTitleList![index]),
                                    subtitle: Text(notesList![index]),
                                    leading: TextButton(
                                      onPressed: () async {
                                        sharedPreferences =
                                            await SharedPreferences
                                                .getInstance();

                                        var addFavTitleList =
                                            notesTitleList![index];
                                        var addFavNotesList = notesList![index];

                                        setState(() {
                                          favnotesTitleList!
                                              .add(addFavTitleList);
                                          favnotesList!.add(addFavNotesList);

                                          print(favnotesTitleList);
                                          print(favnotesList);
                                          // favnotesList!.clear();
                                          // favnotesTitleList!.clear();
                                        });

                                        List<String> favNotesTitle =
                                            favnotesTitleList!
                                                .map((i) => i.toString())
                                                .toList();
                                        sharedPreferences!.setStringList(
                                            "FavNotesTitleList", favNotesTitle);

                                        List<String> favNotesDescrip =
                                            favnotesList!
                                                .map((i) => i.toString())
                                                .toList();
                                        sharedPreferences!.setStringList(
                                            "FavNotesDescriptList",
                                            favNotesDescrip);

                                        print(favNotesTitle);
                                        print(favNotesDescrip);
                                      },
                                      child: Text("add to favorites"),
                                    ),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                            ]))),
          ],
        )),
      ),
    );
  }
}
