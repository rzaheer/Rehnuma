import 'package:finalyearproject/Global.dart';
import 'package:flutter/material.dart';

class AvailableSlots extends StatefulWidget {
  @override
  _AvailableSlotsState createState() => _AvailableSlotsState();
}

class _AvailableSlotsState extends State<AvailableSlots> {
  final timeSlots = [
    "10:00-10:30",
    "10:30-11:00",
    "11:00-11:30",
    "11:30-12:00",
    "12:00-12:30",
    "12:30-13:00",
    "13:00-13:30",
    "13:30-14:00",
    "14:00-14:30",
    "14:30-15:00",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        /* leading: Icon(
          Icons.menu,
          color: secondaryColor,
        ), */
        title: Text(
          'Set your available slots',
          style: TextStyle(
              fontSize: 17, color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: secondaryColor,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'When are you available?',
                style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              Text('Choose your available slots for this week'),
            ],
          ),
        ),
      ),
    );
  }
}

class CardforSlots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class TimeList {
  String name;
  int index;
  TimeList({this.name, this.index});
}

class RadioGroupWidget extends State {
  // Default Radio Button Item
  String radioItem = 'Mango';

  // Group Value for Radio Button.
  int id = 1;

  List<TimeList> tList = [
    TimeList(
      index: 1,
      name: "10:00-10:30",
    ),
    TimeList(
      index: 2,
      name: "10:30-11:00",
    ),
    TimeList(
      index: 3,
      name: "11:00-11:30",
    ),
    TimeList(
      index: 4,
      name: "11:30-12:00",
    ),
    TimeList(
      index: 4,
      name: "12:00-12:30",
    ),
    TimeList(
      index: 4,
      name: "12:30-13:00",
    ),
    TimeList(
      index: 4,
      name: "13:00-13:30",
    ),
  ];

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(14.0),
            child: Text('$radioItem', style: TextStyle(fontSize: 15))),
        Expanded(
            child: Container(
          height: 350.0,
          child: Column(
            children: tList
                .map((data) => RadioListTile(
                      title: Text("${data.name}"),
                      groupValue: id,
                      value: data.index,
                      onChanged: (val) {
                        setState(() {
                          radioItem = data.name;
                          id = data.index;
                        });
                      },
                    ))
                .toList(),
          ),
        )),
      ],
    );
  }
}
