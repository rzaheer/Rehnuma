import 'package:email_auth/email_auth.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/ForgotPassword/ForgotPassword2.dart';
import 'package:flutter/material.dart';

class ForgotPassword1 extends StatefulWidget {
  @override
  _ForgotPassword1State createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends State<ForgotPassword1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void SendOTP() async {
    EmailAuth.sessionName = "Rehnuma";
    var res = await EmailAuth.sendOtp(
      receiverMail: _emailController.value.text,
    );
    if (res) {
      print("OTP Sent");
    } else
      print('We could not sent OTP');
  }

  void VerifyOTP() {
    var res = EmailAuth.validate(
      receiverMail: _emailController.value.text,
      userOTP: _otpController.text,
    );
    if (res) {
      print("OTP Verified");
    } else
      print('Invalid OTP');
  }

  @override
  void initState() {
    super.initState();
    // Initialize the package
    /// Configuring the remote server
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        color: primaryColor,
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(20),
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
              height: size.height / 4,
            ),
            Text(
              'Send Password reset code to :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: size.width / 1.2,
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 16, color: inputTextColor),
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null) {
                      CustomToast().showerrorToast("Enter email");
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                  buttoncolor: buttonColor,
                  height: 50,
                  width: size.width / 3,
                  title: 'SEND CODE',
                  onPressed: () {
                    SendOTP();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPassword2(
                            enteredEmail: _emailController.text)));
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
