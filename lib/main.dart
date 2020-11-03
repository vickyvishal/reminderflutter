import 'package:flutter/material.dart';
import 'reminderMain.dart';
import './epapBody.dart';

void main() => runApp(MyApp());

/// This is the main application widget.This is stateless
class MyApp extends StatelessWidget {
  static const String _title = 'Reminders';

  @override
  Widget build(BuildContext context) {
    //main context widget
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.green,
        ),
        //body: ,
        body: EpapBody(), //this widget has a state
      ),
    );
  }
}
