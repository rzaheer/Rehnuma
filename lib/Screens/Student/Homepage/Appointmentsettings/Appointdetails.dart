import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppointmentDetails extends StatefulWidget {
  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 27,
          ),
          elevation: 0,
          backgroundColor: secondaryColor,
        ),
        bottomNavigationBar: CustomNavbar(index: 3, indashboard: null),
        body: Container(
          padding: EdgeInsets.all(16),
          color: secondaryColor,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Appointment with ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Doctor name',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    FaIcon(
                      FontAwesomeIcons.calendarAlt,
                      color: Colors.green,
                      size: 22,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '1st April 2021, Saturday',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    FaIcon(
                      FontAwesomeIcons.clock,
                      color: Colors.red[700],
                      size: 22,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '01:00 PM',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Session Duration:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '30 minutes',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Charges: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '1000PKR',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  disabledTextColor: Colors.grey,
                  //color: buttonColor,
                  onPressed: () {},
                  child: Text(
                    'Give feedback',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttoncolor: Colors.blue,
                      title: 'Start',
                      onPressed: () {},
                      height: 40,
                      width: size.width / 2.5,
                    ),
                    CustomButton(
                      buttoncolor: Colors.green,
                      title: 'Modify',
                      onPressed: () {},
                      height: 40,
                      width: size.width / 2.5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: CustomButton(
                      buttoncolor: buttonColor,
                      title: 'Cancel',
                      onPressed: () {},
                      height: 40,
                      width: size.width / 1.2),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
        ));
  }
}
