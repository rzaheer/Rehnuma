import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/ForgotPassword/ForgotPassword3.dart';
import 'package:flutter/material.dart';

class ForgotPassword2 extends StatefulWidget {
  @override
  _ForgotPassword2State createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: size.height / 4.5,
            ),
            Text(
              'Enter the code send to ish****@ gmail.com to reset your \npassword',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: size.width / 1.3,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    color: inputTextColor,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputTextColor, width: 1),
                  ),
                  filled: true,
                  fillColor: secondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              buttoncolor: buttonColor,
              width: size.width / 2,
              height: 50,
              title: 'Verify',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword3()));
              },
            ),
          ],
        ),
      )),
    );
  }
}
