import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/ForgotPassword/ForgotPassword2.dart';
import 'package:flutter/material.dart';

class ForgotPassword1 extends StatefulWidget {
  @override
  _ForgotPassword1State createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends State<ForgotPassword1> {
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
              height: size.height / 4,
            ),
            Text(
              'Send Password reset code to :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: null,
                  groupValue: null,
                  onChanged: null,
                ),
                Text(
                  'ishazaheer3@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              buttoncolor: buttonColor,
              height: 50,
              width: size.width / 2,
              title: 'SEND CODE',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword2()));
              },
            ),
          ],
        ),
      )),
    );
  }
}
