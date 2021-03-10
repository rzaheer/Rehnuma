import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister4.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentRegister3 extends StatefulWidget {
  @override
  _StudentRegister3State createState() => _StudentRegister3State();
}

class _StudentRegister3State extends State<StudentRegister3> {
  TextEditingController dobController = TextEditingController();
  final format = DateFormat("dd-MM-yyyy");
  DateTime selectedDate = DateTime.now();
  bool maleSelected = true, femaleSelected = false, otherSelected = false;
  int gender = 2; //1 for female , 2 for male , 3 for other
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                      'Tell us about your \nacademics',
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                          value: 1,
                        ),
                        Text(
                          'Matric/O Levels',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                          value: 2,
                        ),
                        Text(
                          'Intermediate/A Levels',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                          value: 3,
                        ),
                        Text(
                          'Undergraduate',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                          value: 4,
                        ),
                        Text(
                          'Other(Please Specify)',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      height: 45,
                      width: size.width / 1.2,
                      child: TextField(
                        decoration: InputDecoration(
                          focusColor: secondaryColor,
                          fillColor: Colors.white30,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                                builder: (context) => StudentRegister4()));
                      },
                      title: 'NEXT',
                    ),
                  )
                ])),
      ),
    );
  }
}
