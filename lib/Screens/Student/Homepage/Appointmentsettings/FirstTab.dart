import 'package:finalyearproject/CustomWidgets/Appointmentcard.dart';
import 'package:finalyearproject/CustomWidgets/NoAppointmentsFound.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Appointmentsettings/Appointdetails.dart';
import 'package:finalyearproject/models/AppointmentModel.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:finalyearproject/services/StudentProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Scheduledappointments extends StatefulWidget {
  @override
  _ScheduledappointmentsState createState() => _ScheduledappointmentsState();
}

class _ScheduledappointmentsState extends State<Scheduledappointments> {
  StudentProvider studentProvider;
  DBService _db = DBService();

  List<AppointmentModel> appointments = [];
  Future getScheduledAppointments() async {
    await _db
        .getScheduledAppointments(studentProvider.currStudent.studentId)
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
    getScheduledAppointments();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
