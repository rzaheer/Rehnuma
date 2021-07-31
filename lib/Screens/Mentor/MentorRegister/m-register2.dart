import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Mentor/MentorRegister/m-register3.dart';

import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister5.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MentorRegister2 extends StatefulWidget {
  @override
  _MentorRegister2State createState() => _MentorRegister2State();
}

class _MentorRegister2State extends State<MentorRegister2> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          width: size.width,
          height: size.height,
          color: primaryColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'How can we contact  \nyou?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: size.width / 1.2,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: secondaryColor,
                        ),
                        focusColor: secondaryColor,
                        fillColor: Colors.white30,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: size.width / 1.2,
                    child: Row(children: [
                      SizedBox(
                        width: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '+92',
                            hintStyle: TextStyle(
                              color: secondaryColor,
                            ),
                            focusColor: secondaryColor,
                            fillColor: Colors.white30,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: secondaryColor,
                            ),
                            focusColor: secondaryColor,
                            fillColor: Colors.white30,
                            filled: true,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: CustomButton(
                    buttoncolor: buttonColor,
                    height: 50,
                    width: size.width / 2,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorRegister3()));
                    },
                    title: 'NEXT',
                  ),
                )
              ])),
    );
  }
}
