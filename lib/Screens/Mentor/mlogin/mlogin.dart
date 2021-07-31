import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Mentor/MentorHome/mentorhome.dart';
import 'package:finalyearproject/Screens/Mentor/MentorRegister/m-register1.dart';
import 'package:finalyearproject/Screens/Student/ForgotPassword/Forgotpassword1.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/Studenthome.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister1.dart';
import 'package:flutter/material.dart';

class MentorLogin extends StatefulWidget {
  @override
  _MentorLoginState createState() => _MentorLoginState();
}

class _MentorLoginState extends State<MentorLogin> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: size.width,
            height: size.height,
            color: primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Email/Phone Number',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),

                SizedBox(
                  height: 47,
                  width: size.width / 1.2,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontSize: 16,
                        color: inputTextColor,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: secondaryColor,
                      hintText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text('Password',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 45,
                  width: size.width / 1.2,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                        fontSize: 16,
                        color: inputTextColor,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: secondaryColor,
                      hintText: '*********',
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: SizedBox(
                      height: 40,
                      width: size.width / 3,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: buttonColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MentorHome()));
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
                //SizedBox(height: 8),
                Center(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword1()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Divider(
                  color: secondaryColor,
                  endIndent: 2,
                  height: 10,
                ),
                Center(
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: size.width / 2,
                    child: RaisedButton(
                      elevation: 8,
                      color: Color(0xFF045D4E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('Signup with ',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              'assets/images/google.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: size.width / 2,
                    child: RaisedButton(
                      elevation: 8,
                      color: Color(0xFF324272),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentHome()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('Signup with ',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              'assets/images/facebook.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MentorRegister1()));
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'New to Rehnuma? ',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15,
                            //fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Signup now',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
