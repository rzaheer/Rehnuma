import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Login/Login.dart';
import 'package:flutter/material.dart';

class ForgotPassword3 extends StatefulWidget {
  @override
  _ForgotPassword3State createState() => _ForgotPassword3State();
}

class _ForgotPassword3State extends State<ForgotPassword3> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        color: primaryColor,
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  width: 10,
                )),
                Container(
                  width: size.height / 5,
                  height: size.height / 5,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                ),
              ],
            ),
            SizedBox(
              height: size.height / 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('New Password',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: size.width / 1.2,
                child: TextField(
                  style: TextStyle(fontSize: 16, color: inputTextColor),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inputTextColor, width: 1),
                    ),
                    filled: true,
                    fillColor: secondaryColor,
                    hintText: '********',
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('Confirm Password',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: size.width / 1.2,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 16, color: inputTextColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryColor,
                    hintText: '*********',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: CustomButton(
                buttoncolor: buttonColor,
                height: 50,
                width: size.width / 2,
                title: 'CHANGE',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentLogin()));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
