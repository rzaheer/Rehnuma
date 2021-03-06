import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customdialog.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/chatScreens/chat_page.dart';
import 'package:finalyearproject/models/AppointmentModel.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:finalyearproject/services/sharedFunctions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AppointmentDetails extends StatefulWidget {
  final MentorModel mentor;
  final AppointmentModel appointment;
  AppointmentDetails({this.mentor, this.appointment});

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  TextEditingController dateController = TextEditingController();

  DateTime selectedDate;

  var slot;

  @override
  Widget build(BuildContext context) {
    print(widget.mentor.fullName);
    var size = MediaQuery.of(context).size;
    final format = DateFormat("dd/MM/yyyy");
    List<String> slots = [
      "slot 1",
      "slot 1",
      "slot 1",
    ];

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
                  '${widget.mentor.fullName}',
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
                      formatDate(widget.appointment.startTime),
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
                      formatTime12Hr(widget.appointment.startTime),
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
                      '1000',
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
                    widget.appointment.activateChat == false
                        ? CustomButton(
                            buttoncolor: Colors.blue,
                            title: 'Book Session',
                            onPressed: () {
                              ///
                              showDialog(
                                  context: context,
                                  builder: (BuildContext dialogContext) {
                                    return CustomDialog(
                                        buttonText: 'Okay',
                                        contentString:
                                            'Sessions can only be initiated by the counselors.',
                                        titleString: "Session Status????",
                                        button1Function: () {
                                          Navigator.of(context).pop();
                                        });
                                  });
                            },
                            height: 40,
                            width: size.width / 1.2,
                          )
                        : CustomButton(
                            buttoncolor: Colors.blue,
                            title: 'Message',
                            onPressed: () {
                              ///
                              showDialog(
                                  context: context,
                                  builder: (BuildContext dialogContext) {
                                    return CustomDialog(
                                        buttonText: 'Message',
                                        contentString:
                                            'Your session will be initiated now.',
                                        titleString: "Session Initiating????",
                                        button1Function: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ChatPage(
                                                      mentor: widget.mentor,
                                                    )),
                                          );
                                          // Navigator.of(context).pushAndRemoveUntil(
                                          //     MaterialPageRoute(
                                          //         builder: (context) => ChatPage(
                                          //               mentor: widget.mentor,
                                          //             )),
                                          //     (Route<dynamic> route) => false);
                                        });
                                  });
                            },
                            height: 40,
                            width: size.width / 2.5,
                          ),
                    /* CustomButton(
                      buttoncolor: Colors.green,
                      title: 'Modify',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return Container(
                                child: AlertDialog(
                                  title: Text(
                                    'Change your booking slot',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: buttonTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 44,
                                        width: size.width / 1.4,
                                        child: DateTimeField(
                                          controller: dateController,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedDate = value;
                                            });
                                          },
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: inputTextColor,
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                            fillColor: Colors.teal[50],
                                            filled: true,
                                            disabledBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusColor: primaryColor,
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                color: inputTextColor,
                                                fontWeight: FontWeight.bold),
                                            hintText: '01/01/2021',
                                          ),
                                          validator: (val) {
                                            return val == null
                                                ? 'Select date of birth'
                                                : null;
                                          },
                                          format: format,
                                          onShowPicker:
                                              (context, currentValue) async {
                                            return showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1900),
                                                initialDate: currentValue ??
                                                    DateTime.now(),
                                                lastDate: DateTime(2100));
                                          },
                                        ),
                                      ),
                                      Text(
                                        'Date:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        child: DropdownButtonFormField(
                                          hint: Text(
                                            '',
                                            style: TextStyle(
                                                color: secondaryColor),
                                          ),
                                          items: slots.map((String field) {
                                            return new DropdownMenuItem(
                                                value: field,
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(field),
                                                  ],
                                                ));
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() => slot = newValue);
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20),
                                            filled: true,
                                            fillColor: Colors.white30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      height: 40,
                      width: size.width / 2.5,
                    ), */
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: CustomButton(
                    buttoncolor: buttonColor,
                    title: 'Cancel',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return CustomDialog(
                              buttonText: 'Okay',
                              contentString:
                                  'Your appointment has been cancelled, The amount will be refunded to your account.',
                              titleString: "Appointment Cancelled ??????",
                              button1Function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatPage(
                                            mentor: widget.mentor,
                                          )),
                                );
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (context) => ChatPage(
                                //               mentor: widget.mentor,
                                //             )),
                                //     (Route<dynamic> route) => false);
                              });
                        },
                      );
                    },
                    height: 40,
                    width: size.width / 1.2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
        ));
  }
}
