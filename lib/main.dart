// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/shared_pref/shared_pref_counter.dart';
import 'package:flutter_shared_preferences/shared_pref/shared_pref_notes.dart';
import 'shared_pref/notes/notes.dart';
import 'shared_pref/shared_pref_switch.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPrefSwitch(),
      routes: {
        "/shared-pref_switch": (context) => SharedPrefSwitch(),
        "/shared_pref_counter": (context) => SharedPrefCounter(),
        "/shared_pref_notes": (context) => SharedPrefNotes(),
        "/notes": (context) => Notes()
      },
    );
  }
}
