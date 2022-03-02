// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, prefer_collection_literals, prefer_final_fields, avoid_print, unnecessary_null_comparison, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefNotes extends StatefulWidget {
  @override
  _SharedPrefNotesState createState() => _SharedPrefNotesState();
}

class _SharedPrefNotesState extends State<SharedPrefNotes> {
  List<dynamic> notesTitleList = [];
  List<dynamic> notesList = [];

  TextEditingController notesTitleController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  SharedPreferences? sharedPreferences;

  addNote() {
    if (notesTitleController.text == "") {
      print("Please write note title");
    } else if (notesController.text == "") {
      print("Please write note description");
    } else {
      setState(() {
        notesTitleList.add(notesTitleController.text);
        // print(notesTitleList);

        notesList.add(notesController.text);
        // print(notesList);
      });
      saveNotes();
      notesTitleController.clear();
      notesController.clear();
    }
  }

  saveNotes() async {
    sharedPreferences = await SharedPreferences.getInstance();

    List<String> saveNotesTitle =
        notesTitleList.map((i) => i.toString()).toList();
    sharedPreferences!.setStringList("notesTitleList", saveNotesTitle);

    List<String> saveNotes = notesList.map((i) => i.toString()).toList();
    sharedPreferences!.setStringList("notesList", saveNotes);
    print(saveNotes);
    print("note Saved !");
  }

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

  goToNotes() {
    Navigator.of(context).pushNamed("/notes");
  }

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("_Shar_Pref_Notes")),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      controller: notesTitleController,
                      decoration:
                          InputDecoration(labelText: "Enter Note Title")),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      controller: notesController,
                      decoration: InputDecoration(labelText: "Enter Notes")),
                ),
                ElevatedButton(onPressed: addNote, child: Text("Save Note")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: goToNotes, child: Text("View Notes")),
              ],
            ),
          ),
        ));
  }
}
