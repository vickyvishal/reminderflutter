/// This is the stateful widget that the main application instantiates.
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
} //how to use this state

class _CalenderState extends State<Calender> {
  CalendarController _controller;
  DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  void _handleSelectedDay(selectedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });

    print(_selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a date'),
      ),
      body: TableCalendar(
        calendarStyle: CalendarStyle(todayColor: Colors.green),
        calendarController: _controller,
        onDaySelected: (day, events, holidays) => _handleSelectedDay(day),
      ),
    );
  }
}
