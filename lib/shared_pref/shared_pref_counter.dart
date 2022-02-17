// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefCounter extends StatefulWidget {
  @override
  _SharedPrefCounterState createState() => _SharedPrefCounterState();
}

class _SharedPrefCounterState extends State<SharedPrefCounter> {
  int incre = 0;
  int? savedCounter;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences? prefs;

  increment() {
    setState(() {
      incre++;
    });
    prefs!.setInt("savedCounter", incre);
  }

  getCountValues() async {
    prefs = await _prefs;
    savedCounter =
        prefs!.containsKey("savedCounter") ? prefs!.getInt("savedCounter") : 0;

    setState(() {
      incre = savedCounter!;
    });
  }

  @override
  void initState() {
    getCountValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("_Shar_Pref_Counter"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: increment,
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          // Example # 2

          child: Center(
            child: Text(
                "Counter: ${incre}"
                // .toString()
                ,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
