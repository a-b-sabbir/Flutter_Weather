import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    _getDataFromSharedPrefs();
  }

  late Map<String, dynamic> prefAsDartObject = {};
  _getDataFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString("data");
    var prefAsDartObject = json.decode(jsonString!); // as dart object

    print(prefAsDartObject);
    return prefAsDartObject;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dd'),
      ),
      body: prefAsDartObject == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Text(
                "$prefAsDartObject",
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
