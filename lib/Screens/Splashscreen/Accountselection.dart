import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Login/Login.dart';
import 'package:flutter/material.dart';

class AccountSelection extends StatefulWidget {
  @override
  _AccountSelectionState createState() => _AccountSelectionState();
}

class _AccountSelectionState extends State<AccountSelection> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: primaryColor,
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height / 8,
          ),
          Container(
            width: size.height / 3.5,
            height: size.height / 3.5,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
            color: Colors.amber,
          ),
          Expanded(
              child: SizedBox(
            height: 10,
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, right: 150),
            child: Text(
              'Are you:',
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(
            width: size.width / 1.5,
            height: size.width / 4,
            child: RaisedButton(
              highlightColor: highlightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white60,
              onPressed: () {},
              child: Center(
                child: Text(
                  'Mentor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: buttonTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: size.width / 1.5,
            height: size.width / 4,
            child: RaisedButton(
              highlightColor: highlightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white60,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentLogin()));
              },
              child: Center(
                child: Text(
                  'Student',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: buttonTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height / 9),
        ],
      ),
    ));
  }
}
