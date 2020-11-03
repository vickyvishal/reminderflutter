import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import './reminderMain.dart';
import './reminderWidget.dart';

var uuid = Uuid();

class EpapBody extends StatefulWidget {
  @override
  _EpapBodyState createState() => _EpapBodyState();
}

enum RepeatEnum { hourly, daily, weekly, monthly, none }

class Reminder {
  String reminderName;
  DateTime pickedDate;
  TimeOfDay pickedTime;
  bool isExpanded;
  bool isActive;
  bool isDeleted;
  RepeatEnum cycle;
  var id;

  Reminder({
    this.reminderName,
    this.pickedDate,
    this.pickedTime,
    this.isActive,
    this.isExpanded,
    this.isDeleted,
    this.cycle,
    this.id,
  });
}

class _EpapBodyState extends State<EpapBody> {
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  String reminderName = "New Reminder";
  RepeatEnum pickedCycle = RepeatEnum.none;
  List<Reminder> reminders = [];
  bool isActive = false;
  bool isDeleted = false;
  bool isExpanded = false;
  var id;

  Reminder generateReminder() {
    return Reminder(
      reminderName: reminderName,
      pickedDate: pickedDate,
      pickedTime: pickedTime,
      isActive: isActive,
      isExpanded: isExpanded,
      isDeleted: isDeleted,
      id: uuid.v4(),
    );
  }

  void addNewReminder(Reminder reminder) {
    setState(() {
      reminders.add(reminder);
    });
  }

  void onChange(List<Reminder> reminders) {
    setState(() {
      reminders = reminders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReminderMain(
              reminders,
              onChange,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          _pickName();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [

  //         ],
  //       ),
  //     ),
  //   );
  // }

  _pickName() {
    TextEditingController _nameController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //title: Text("Name"),
          title: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 1.0,
                ),
              ),
            ),
            autocorrect: false,
            controller: _nameController,
            onChanged: (String value) {
              setState(() {
                reminderName = value;
              });
            },
          ),

          // content: TextFormField(
          //   controller: _nameController,
          // ),
          actions: [
            MaterialButton(
              elevation: 5.0,
              child: Text("Done"),
              onPressed: () {
                if (_nameController.text.toString() != "") {
                  setState(() {
                    reminderName = _nameController.text.toString();
                  });
                } else {
                  setState(() {
                    reminderName = "New Reminder";
                  });
                }
                Navigator.of(context).pop(_nameController);
                _pickDate();
              },
            )
          ],
        );
      },
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 20),
      initialDate: pickedDate,
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
      _pickTime();
    }
  }

  _pickCycle() {
    TextEditingController _cycleController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(""),
          content: TextField(
            controller: _cycleController,
          ),
          actions: [
            MaterialButton(
              elevation: 5.0,
              child: Text("Done"),
              onPressed: () {
                setState(() {
                  reminderName = _cycleController.text.toString();
                });
                Navigator.of(context).pop(_cycleController);
                _pickDate();
              },
            )
          ],
        );
      },
    );
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
    Reminder newReminder = generateReminder();
    addNewReminder(newReminder);
  }
}
