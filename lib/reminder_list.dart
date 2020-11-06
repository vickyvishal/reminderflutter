import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import './reminderMain.dart';
import './reminder_card.dart';
import './new_timer_screen.dart';

var uuid = Uuid();

class ReminderList extends StatelessWidget {
  List reminders;
  bool isFullLength = true;
  static const String _title = 'Reminders';

  ReminderList(
    this.reminders,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.green,
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
        // actions:[
        //   IconButton(
        //     icon: Icon(Icons.search, color: Colors.black),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.person, color: Colors.black),
        //     onPressed: () {},
        //   )
        // ],
      ),
      body: reminders.length > 0
          ? SingleChildScrollView(
              child: Column(children: [
                ...(reminders).map((reminder) {
                  return ReminderCard(isFullLength, reminder);
                }).toList()
              ]),
            )
          : Center(
              child: Container(
                child: Image.asset('images/lotus.png'),
                width: 80.0,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        // onPressed: () {
        //   _pickName();
        // },
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/newReminder',
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
