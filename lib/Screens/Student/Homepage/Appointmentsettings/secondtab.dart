import 'package:finalyearproject/CustomWidgets/Appointmentcard.dart';
import 'package:finalyearproject/CustomWidgets/NoAppointmentsFound.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/models/AppointmentModel.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:finalyearproject/services/StudentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PastAppointments extends StatefulWidget {
  @override
  _PastAppointmentsState createState() => _PastAppointmentsState();
}

class _PastAppointmentsState extends State<PastAppointments> {
  StudentProvider studentProvider;
  DBService _db = DBService();

  List<AppointmentModel> appointments = [];
  Future getPastAppointments() async {
    await _db
        .getPastAppointments(studentProvider.currStudent.studentId)
        .then((value) {
      if (value != null) {
        print(value);
        setState(() {
          appointments.addAll(value);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentProvider = Provider.of<StudentProvider>(context, listen: false);
    getPastAppointments();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            appointments.length == 0
                ? NoAppointmentsFound()
                : ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: appointments.length,
                    itemBuilder: (_, i) {
                      return AppointmentCard(
                        appointmentModel: appointments[i],
                        isPast: true,
                      );
                    })

            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     border: Border(
            //       bottom: BorderSide(color: inputTextColor, width: 1),
            //       left: BorderSide(
            //         color: inputTextColor,
            //         width: 1,
            //       ),
            //       right: BorderSide(
            //         color: inputTextColor,
            //         width: 1,
            //       ),
            //       top: BorderSide(
            //         color: inputTextColor,
            //         width: 1,
            //       ),
            //     ),
            //   ),
            //   height: size.height / 4,
            //   width: size.width / 1.1,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Text(
            //             'Appointment with ',
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 18,
            //             ),
            //           ),
            //           Text(
            //             'Doctor name',
            //             style: TextStyle(
            //               color: primaryColor,
            //               fontSize: 18,
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 16,
            //       ),
            //       Row(
            //         children: [
            //           SizedBox(
            //             width: 10,
            //           ),
            //           FaIcon(
            //             FontAwesomeIcons.calendarAlt,
            //             color: Colors.green,
            //             size: 22,
            //           ),
            //           SizedBox(
            //             width: 20,
            //           ),
            //           Text(
            //             '1st April 2021, Saturday',
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 15,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 7,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             width: 10,
            //           ),
            //           FaIcon(
            //             FontAwesomeIcons.userClock,
            //             color: Colors.red[700],
            //             size: 22,
            //           ),
            //           SizedBox(
            //             width: 20,
            //           ),
            //           Text(
            //             '01:00 PM',
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 15,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Expanded(
            //             child: SizedBox(
            //               width: 10,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 30,
            //             width: size.width / 2.5,
            //             child: RaisedButton(
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(15)),
            //               splashColor: Colors.white,
            //               highlightColor: buttonColor,
            //               disabledColor: buttonTextColor,
            //               focusColor: buttonColor,
            //               elevation: 6,
            //               color: primaryColor,
            //               // padding: const EdgeInsets.all(8.0),
            //               onPressed: () {
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) => AppointmentDetails()));
            //               },
            //               child: Text(
            //                 'View details',
            //                 style: TextStyle(
            //                   color: textColor,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
