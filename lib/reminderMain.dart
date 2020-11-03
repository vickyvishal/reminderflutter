import 'package:flutter/material.dart';
import './epapBody.dart';
import './reminderBox.dart';

// This is the stateful widget that the main application instantiates.
class ReminderMain extends StatefulWidget {
  //ReminderMain({Key key, this.generateReminder, this.addNewReminder,}) : super(key: key);
  List<Reminder> reminders;
  final Function onChange;

  ReminderMain(
    this.reminders,
    this.onChange,
  );

  @override
  _ReminderMainState createState() => _ReminderMainState();
}

class _ReminderMainState extends State<ReminderMain> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: _buildPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    if (widget.reminders.isNotEmpty) {
      return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            widget.reminders[index].isExpanded = !isExpanded;
          });
        },
        children: widget.reminders.map<ExpansionPanel>((reminder) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListTile(
                      title: Text(
                        reminder.reminderName,
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(fontSizeFactor: 1.3),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Switch(
                      value: reminder.isActive,
                      onChanged: (value) {
                        reminder.isActive = !reminder.isActive;
                        widget.onChange(widget.reminders);
                      },
                      activeTrackColor: Colors.green,
                      activeColor: Colors.white,
                    ),
                  )
                ],
              );
            },
            body: ReminderBox(
                reminder,
                (id) => {
                      widget.reminders.removeWhere((item) => item.id == id),
                      widget.onChange(widget.reminders)
                    }),
            isExpanded: reminder.isExpanded,
          );
        }).toList(),
      );
    } else {
      return ListTile(
        title: Center(
          child: Text("No Reminder Added"),
        ),
      );
    }
  }
}
