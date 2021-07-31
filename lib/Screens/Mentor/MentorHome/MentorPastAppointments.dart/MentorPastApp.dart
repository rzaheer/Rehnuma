import 'package:finalyearproject/CustomWidgets/Appointmentcard.dart';
import 'package:flutter/material.dart';

import '../../../../Global.dart';

class MentorPastAppointments extends StatefulWidget {
  @override
  _MentorPastAppointmentsState createState() => _MentorPastAppointmentsState();
}

class _MentorPastAppointmentsState extends State<MentorPastAppointments> {
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
          'Past Appointments',
          style: TextStyle(
              fontSize: 17, color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCard(
                  docname: 'Ms. Kinza',
                  dateDay: '12th Jan 2020',
                  time: '11:00 AM'),
              SizedBox(
                height: 10,
              ),
              CustomCard(
                  docname: 'Ms. Ramsha',
                  dateDay: '13th Jan 2020',
                  time: '11:00 AM'),
              SizedBox(
                height: 10,
              ),
              CustomCard(
                  docname: 'Ms. Urooj',
                  dateDay: '14th Jan 2020',
                  time: '11:00 AM'),
              SizedBox(
                height: 10,
              ),
              CustomCard(
                  docname: 'Mr. Ammar',
                  dateDay: '15th Jan 2020',
                  time: '11:00 AM'),
              SizedBox(
                height: 10,
              ),
              CustomCard(
                  docname: 'Mr. Omama',
                  dateDay: '16th Jan 2020',
                  time: '11:00 AM'),
            ],
          ),
        ),
      ),
    );
  }
}
