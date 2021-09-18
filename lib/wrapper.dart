import 'package:finalyearproject/Screens/Splashscreen/Accountselection.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/Studenthome.dart'
    show StudentHome;
import 'package:finalyearproject/Screens/Student/Login/Login.dart';
import 'package:finalyearproject/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CustomWidgets/Loading.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool loading = false;
  onAppStart() async {
    setState(() {
      loading = true;
    });

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    // return either the Home or Authenticate widget
    if (loading == true) {
      return Loading();
    } else {
      if (user == null) {
        return StudentLogin();
      } else if (user != null) {
        // AuthService().setProvider(user, context);
        return StudentHome();
      }
    }
  }
}
