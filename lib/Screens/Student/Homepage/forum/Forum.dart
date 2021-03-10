import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: secondaryColor,
      ),
      bottomNavigationBar: CustomNavbar(index: 2, indashboard: null),
      body: Center(
          child: Container(
              child: Text(
        'Coming Soon!',
        style: TextStyle(
            fontSize: 22, color: buttonColor, fontWeight: FontWeight.bold),
      ))),
    );
  }
}
