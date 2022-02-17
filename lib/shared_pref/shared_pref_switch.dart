// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSwitch extends StatefulWidget {
  @override
  _SharedPrefSwitchState createState() => _SharedPrefSwitchState();
}

class _SharedPrefSwitchState extends State<SharedPrefSwitch> {
  bool isSwitched = false;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences? prefs;

  getValue() async {
    prefs = await _prefs;
    setState(() {
      isSwitched = (prefs!.containsKey("switchValue")
          ? prefs!.getBool("switchValue")
          : false)!;
    });
  }

  goToCounter() {
    Navigator.of(context).pushNamed("/shared_pref_counter");
  }

  goToNotes() {
    Navigator.of(context).pushNamed("/shared_pref_notes");
  }

  @override
  void initState() {
    getValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter_Shar_Pref"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: goToCounter,
              label: Text('Counter'),
              icon: Icon(Icons.arrow_forward),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: FloatingActionButton.extended(
                onPressed: goToNotes,
                label: Text('Notes'),
                icon: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Example # 1
            Center(
              child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                    prefs!.setBool("switchValue", isSwitched);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }
}
