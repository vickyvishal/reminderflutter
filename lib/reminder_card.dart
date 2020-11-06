import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './main.dart';

// ignore: must_be_immutable
class ReminderCard extends StatelessWidget {
  bool isFullLength;
  Reminder reminder;

  ReminderCard(
    this.isFullLength,
    this.reminder,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: isFullLength
      //     ? MediaQuery.of(context).size.width - 2
      //     : (MediaQuery.of(context).size.width - 2) / 2,
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(20.0)),
        // color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 20.0),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              trailing: Image.asset('images/shopping.png'),
              title: Text(
                reminder.reminderName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                reminder.description,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10.0,
                ),
                child: Text(
                  DateFormat('MMMd').format(reminder.pickedDate),
                  style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10.0,
                ),
                child: Text(
                  reminder.pickedTime.format(context),
                  style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10.0,
                ),
                child: Text(
                  reminder.cycle
                      .toString()
                      .substring(reminder.cycle.toString().indexOf('.') + 1),
                  style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
