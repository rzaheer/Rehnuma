import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Accountsettings/Accountdetails.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Appointmentsettings/Appointments.dart';
import 'package:finalyearproject/Screens/Student/Homepage/forum/Forum.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Recommender/Recommender.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/Studenthome.dart';
import 'package:finalyearproject/Screens/chatScreens/allChatsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavbar extends StatefulWidget {
  final int index;
  final bool indashboard;
  const CustomNavbar(
      {Key key, @required this.index, @required this.indashboard})
      : super(key: key);
  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: inputTextColor,
        backgroundColor: primaryColor,
        unselectedItemColor: secondaryColor,
        selectedFontSize: 12,
        selectedLabelStyle:
            TextStyle(fontStyle: FontStyle.italic, color: inputTextColor),
        unselectedLabelStyle: TextStyle(color: secondaryColor),
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.index,
        elevation: 12,
        unselectedFontSize: 12,
        onTap: (index) {
          if (index == widget.index && widget.indashboard == false) {
          } else {
            if (index == 0) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => StudentHome()),
                  (Route<dynamic> route) => false);
            }
            if (index == 1) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Recommender()),
                  (Route<dynamic> route) => false);
            }
            if (index == 2) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Forum()),
                  (Route<dynamic> route) => false);
            }
            if (index == 3 || index == 4) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => StudentAppointments()),
                  (Route<dynamic> route) => false);
            }
            if (index == 4) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => AccountDetails()),
                  (Route<dynamic> route) => false);
            }
            // if (index == 5) {
            //   Navigator.of(context).pushAndRemoveUntil(
            //       MaterialPageRoute(builder: (context) => ChatsPage()),
            //       (Route<dynamic> route) => false);
            // }
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 22,
            ),
            title: Text('Home',
                style: TextStyle(
                  fontSize: 12,
                )),
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.graduationCap,
                size: 22,
              ),
              title: Text('Recommender',
                  style: TextStyle(
                    fontSize: 10,
                  ))),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.comments,
                size: 22,
              ),
              title: Text('Forum',
                  style: TextStyle(
                    fontSize: 12,
                  ))),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.calendarCheck,
              size: 22,
            ),
            title: Text(
              'Appointments',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 22,
              ),
              title: Text('Account',
                  style: TextStyle(
                    fontSize: 12,
                  ))),
        ]);
  }
}
