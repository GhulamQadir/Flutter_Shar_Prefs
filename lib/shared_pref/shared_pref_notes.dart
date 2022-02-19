// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, prefer_collection_literals, prefer_final_fields, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefNotes extends StatefulWidget {
  @override
  _SharedPrefNotesState createState() => _SharedPrefNotesState();
}

class _SharedPrefNotesState extends State<SharedPrefNotes> {
  List<String> notesList = [];
  TextEditingController notesController = TextEditingController();

  SharedPreferences? sharedPreferences;

  addNote() {
    if (notesController.text == "") {
      print("Please write something");
    } else {
      setState(() {
        notesList.add(notesController.text);
        print(notesList);
        saveNotes();
        notesController.clear();
      });
    }
  }

  saveNotes() async {
    sharedPreferences = await SharedPreferences.getInstance();

    List<String> saveNotes = notesList.map((i) => i.toString()).toList();
    sharedPreferences!.setStringList("notesList", saveNotes);
    print(saveNotes);
    print("note Saved !");
  }

  goToNotes() {
    Navigator.of(context).pushNamed("/notes");
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
                      controller: notesController,
                      decoration: InputDecoration(labelText: "Enter Notes")),
                ),
                ElevatedButton(onPressed: addNote, child: Text("Save Note")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: goToNotes, child: Text("View Notes"))
              ],
            ),
          ),
        ));
  }
}
