import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/AvailableSlot/Availableslots.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/DocProfile/DocProfile.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/DrawerItems/About.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/DrawerItems/Accountsettings.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/DrawerItems/Earningdetails.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/DrawerItems/Termsandcond.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/Mentorscheduledapp.dart/mentorscheduleapp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MentorPastAppointments.dart/MentorPastApp.dart';

class MentorHome extends StatefulWidget {
  @override
  _MentorHomeState createState() => _MentorHomeState();
}

class _MentorHomeState extends State<MentorHome> {
  int selectedIndex;
  final List<Map> items = [
    {
      "img": "assets/images/scheduleapp.png",
      "name": "Scheduled Appointments",
    },
    {"img": "assets/images/pastapp.png", "name": "Past Appointments"},
    {"img": "assets/images/user.png", "name": "My Profile"},
    {
      "img": "assets/images/addappointment.png",
      "name": "Set your available slots"
    },
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
          'Home',
          style: TextStyle(
              fontSize: 17, color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: secondaryColor,
              ),
              onPressed: null)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Ramsha Zaheer",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail: Text("ramshazaheer@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.android
                        ? secondaryColor
                        : primaryColor,
                child: Text(
                  "R",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Account Settings'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Accountsetting()));
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.moneyBill),
              title: Text('Earning Details'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Earningdetails()));
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.file),
              title: Text('Terms & Conditions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsAndConditions()));
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact us'),
              onTap: () {},
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.infoCircle,
              ),
              title: Text('About the app'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Aboutus()));
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.signOutAlt,
              ),
              title: Text('Log out'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: secondaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                child: Text(
                  'Welcome, Dr. Khan',
                  style: TextStyle(
                      fontSize: 22,
                      color: inputTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                if (index == 0) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          MentorScheduledAppointments()));
                                } else if (index == 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          MentorPastAppointments()));
                                } else if (index == 2) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DoctorProfile()));
                                } else if (index == 3) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AvailableSlots()));
                                }
                              });
                            },
                            child: Card(
                              color: selectedIndex == index
                                  ? primaryColor
                                  : secondaryColor,
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 1, color: primaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              /*   decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.teal[200],
                                  Colors.teal,
                                ],
                              ),
                             ), */
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      items[index]['img'],
                                      fit: BoxFit.cover,
                                    ),
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    items[index]['name'],
                                    maxLines: 2,
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: selectedIndex == index
                                          ? secondaryColor
                                          : buttonTextColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
