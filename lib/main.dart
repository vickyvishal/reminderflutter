import 'package:flutter/material.dart';
import 'reminderMain.dart';
import './epapBody.dart';
import './new_timer_screen.dart';
import './reminder_list.dart';

void main() => runApp(MyApp());

enum Cycle { Weekly, Monthly, None }

class Reminder {
  String reminderName;
  DateTime pickedDate;
  TimeOfDay pickedTime;
  Cycle cycle;
  String description;

  // createReminder() {
  //   return {
  //     "reminderName": reminderName,
  //     "pickedDate": pickedDate,
  //     //"pickedTime": pickedTime
  //   };
  // }

  Reminder(
    this.reminderName,
    this.pickedDate,
    this.pickedTime,
    this.cycle,
    this.description,
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Reminder> reminders = [];
  static const String _title = 'Reminders';

  void addReminder(newReminder) {
    setState(() {
      reminders.add(newReminder);
    });
    //print(reminder["reminderName"]);
  }

  @override
  Widget build(BuildContext context) {
    //main context widget
    return MaterialApp(
        //title: _title,
        initialRoute: '/list',
        routes: {
          '/list': (context) => ReminderList(reminders),
          '/newReminder': (context) => NewTimerScreen(addReminder),
        });
  }
}
