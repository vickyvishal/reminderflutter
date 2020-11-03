import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './epapBody.dart';

class ReminderBox extends StatelessWidget {
  Reminder reminder;
  final Function removeReminder;
  bool showCycle = true;

  ReminderBox(
    this.reminder,
    this.removeReminder,
  );

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Container(
        // decoration: BoxDecoration(
        //   border: Border(
        //     top: BorderSide(width: .0, color: Colors.lightBlue.shade900),
        //   ),
        //   color: Colors.white,
        // ),
        child: Column(
          children: [
            CheckboxListTile(
              title: Text("Repeat"),
              value: showCycle,
              onChanged: (newValue) {
                setState(() {
                  showCycle = newValue;
                });
              },
              activeColor: Colors.green,
              checkColor: Colors.white,
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            if (showCycle) Text("data"),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Container(
                        padding: EdgeInsets.all(3.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.calendar_today,
                                size: double.parse("18"),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                DateFormat('d/M/yy')
                                    .format(reminder.pickedDate),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Container(
                        padding: EdgeInsets.all(3.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.access_time_outlined,
                                size: double.parse("18"),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                reminder.pickedTime.format(context),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete_outlined,
                      //color: Colors.redAccent,
                    ),
                    onPressed: () {
                      removeReminder(reminder.id);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
