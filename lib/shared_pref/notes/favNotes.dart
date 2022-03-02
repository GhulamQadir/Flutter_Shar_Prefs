// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavNotes extends StatefulWidget {
  @override
  _FavNotesState createState() => _FavNotesState();
}

class _FavNotesState extends State<FavNotes> {
  SharedPreferences? sharedPreferences;

  List<String>? favNotesTitleList = [];
  List<String>? favNotesDescriptList = [];
  Future getFavNotes() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? getFavNotesTitleList =
        sharedPreferences?.getStringList('FavNotesTitleList');
    favNotesTitleList = getFavNotesTitleList!.map((e) => e.toString()).toList();
    setState(() {});

    List<String>? getFavNotesList =
        sharedPreferences?.getStringList('FavNotesDescriptList');
    favNotesDescriptList = getFavNotesList!.map((e) => e.toString()).toList();
    setState(() {});
  }

  @override
  void initState() {
    getFavNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Favorite Notes"),
        ),
        body: ListView.builder(
            itemCount: favNotesTitleList!.length,
            itemBuilder: (context, index) => Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ListTile(
                          title: Text(favNotesTitleList![index]),
                          subtitle: Text(favNotesDescriptList![index]),
                        ),
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
