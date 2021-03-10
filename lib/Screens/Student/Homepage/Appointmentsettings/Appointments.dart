import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Appointmentsettings/FirstTab.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Appointmentsettings/secondtab.dart';
import 'package:flutter/material.dart';

class StudentAppointments extends StatefulWidget {
  @override
  StudentAppointmentsState createState() => StudentAppointmentsState();
}

class StudentAppointmentsState extends State<StudentAppointments>
    with SingleTickerProviderStateMixin {
  final docnames = ["Dr. Moosa Khan", "Dr. Adeel Raza", "Dr. Huma Irfan"];
  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Added
      length: 2, // Added
      initialIndex: 0, //Added
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          /* title: Text(
            'Appointments',
            style: TextStyle(color: Colors.black, fontSize: 13),
          ), */
          leading: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 27,
          ),
          elevation: 0,
          backgroundColor: secondaryColor,
          /* actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.settings,
                color: primaryColor,
                size: 27,
              ),
            )
          ], */
          bottom: TabBar(
            // controller: _tabController,
            unselectedLabelColor: Colors.black,
            labelColor: primaryColor,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelStyle: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),

            tabs: [
              new Tab(
                child: Text(
                  'SCHEDULED',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              new Tab(
                child: Text(
                  'PAST',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavbar(index: 3, indashboard: null),
        body: TabBarView(
          children: [
            //1st tab
            Scheduledappointments(),
            PastAppointments(),
            //2ND TAB
          ],
        ),
      ),
    );
  }
}
