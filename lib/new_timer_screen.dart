import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import './main.dart';

class NewTimerScreen extends StatefulWidget {
  final Function addReminder;

  NewTimerScreen(
    this.addReminder,
  );
  @override
  _NewTimerScreenState createState() => _NewTimerScreenState();
}

class _NewTimerScreenState extends State<NewTimerScreen> {
  String reminderName = "New Reminder";
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  String description = "";
  Cycle cycle = Cycle.None;

  static const String _title = 'New Reminder';

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
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search, color: Colors.black),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.person, color: Colors.black),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    //name header
                    margin: EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          reminderName = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    //name header
                    margin: EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 15.0, left: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  blurRadius: 5.0),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _pickDate();
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  _pickDate();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                "Today",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  _pickDate();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                "15th Nov",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.greenAccent),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  _pickDate();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                DateFormat('MMMd').format(pickedDate),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //name header
                    margin: EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Time",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 15.0, left: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  blurRadius: 5.0),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _pickTime();
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  _pickTime();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                "10:00 am",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  _pickDate();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                "8:00 pm",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                border: Border.all(color: Colors.greenAccent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  _pickTime();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                pickedTime.format(context),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //name header
                    margin: EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Repeat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                border: cycle == Cycle.Weekly
                                    ? Border.all(color: Colors.greenAccent)
                                    : Border.all(color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  setState(() {
                                    cycle = Cycle.Weekly;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                "Weekly",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 5.0),
                                ],
                                border: cycle == Cycle.Monthly
                                    ? Border.all(color: Colors.greenAccent)
                                    : Border.all(color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  setState(() {
                                    cycle = Cycle.Monthly;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, left: 15.0),
                              child: Text(
                                "Monthly",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //name header
                    margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Desciption",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          description = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    width: double.infinity,
                    child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      //buttonColor: Color(0xffff889f),
                      buttonColor: Colors.green,
                      child: RaisedButton(
                        onPressed: () {
                          Reminder newReminder = Reminder(
                            reminderName,
                            pickedDate,
                            pickedTime,
                            cycle,
                            description,
                          );

                          widget.addReminder(newReminder);
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Text(
                            "Add Reminder",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 20),
      initialDate: pickedDate,
    );

    // Future date = showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext builder) {
    //       return Container(
    //         height: MediaQuery.of(context).copyWith().size.height / 3,
    //       );
    //     });

    print(date);

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: pickedTime,
    );

    if (time != null) {
      setState(() {
        pickedTime = time;
      });
    }
  }
}
