// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SharedPrefNotes extends StatefulWidget {
  @override
  _SharedPrefNotesState createState() => _SharedPrefNotesState();
}

class _SharedPrefNotesState extends State<SharedPrefNotes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("_Shar_Pref_Notes")),
      ),
    ));
  }
}
