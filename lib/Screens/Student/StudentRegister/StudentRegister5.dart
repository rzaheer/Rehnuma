import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister3.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentRegister5 extends StatefulWidget {
  @override
  _StudentRegister5State createState() => _StudentRegister5State();
}

class _StudentRegister5State extends State<StudentRegister5> {
  TextEditingController dobController = TextEditingController();
  final format = DateFormat("dd-MM-yyyy");
  DateTime selectedDate = DateTime.now();
  bool maleSelected = true, femaleSelected = false, otherSelected = false;
  int gender = 2; //1 for female , 2 for male , 3 for other

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                    'Choose a password for   \nyour account',
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
                          borderSide:
                              BorderSide(color: inputTextColor, width: 1),
                        ),
                        filled: true,
                        fillColor: secondaryColor,
                        hintText: '********',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text('Confirm Password',
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
                              builder: (context) => StudentRegister3()));
                    },
                    title: 'NEXT',
                  ),
                )
              ])),
    );
  }
}
