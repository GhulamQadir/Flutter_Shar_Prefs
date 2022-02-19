// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  SharedPreferences? sharedPreferences;
  List<String> notesList = [];

  getNotes() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? getNotesList = sharedPreferences?.getStringList('notesList');
    notesList = getNotesList!.map((e) => e.toString()).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notes List Screen"),
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
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: notesList.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    notesList[index],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            )),
                  )
          ],
        )),
      ),
    );
  }
}
