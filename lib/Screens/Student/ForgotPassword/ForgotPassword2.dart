import 'dart:async';

import 'package:email_auth/email_auth.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/ForgotPassword/ForgotPassword3.dart';
import 'package:finalyearproject/Screens/Student/Login/Login.dart';
import 'package:flutter/material.dart';

class ForgotPassword2 extends StatefulWidget {
  final String enteredEmail;
  ForgotPassword2({this.enteredEmail});

  @override
  _ForgotPassword2State createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  @override
  Timer _timer;
  int _start = 120;
  final TextEditingController _otpController = TextEditingController();
  String otpEmail;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    otpEmail = widget.enteredEmail;
    print(otpEmail);
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void VerifyOTP() {
    var res = EmailAuth.validate(
        receiverMail: otpEmail, userOTP: _otpController.text);
    if (res) {
      print("OTP Verified");
      CustomToast().showsuccessToast('Verified👍');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ForgotPassword3(email: otpEmail)));
    } else
      print('Invalid OTP');
    CustomToast().showerrorToast("Invalid OTP. Please try again");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentLogin()));
  }

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
              height: size.height / 5,
            ),
            Text(
              'Enter the code send to ${otpEmail} to reset your \npassword',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
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
                dispose();
                VerifyOTP();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Code expires in:',
                  style: TextStyle(color: secondaryColor, fontSize: 16),
                ),
                _start <= 90
                    ? Text("$_start seconds",
                        style: TextStyle(color: buttonColor, fontSize: 16))
                    : Text("$_start seconds",
                        style: TextStyle(color: secondaryColor, fontSize: 16)),
              ],
            )
          ],
        ),
      )),
    );
  }
}
