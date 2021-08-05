/* import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:flutter/material.dart';

import 'StudentRegister5.dart';

class StudentRegister3 extends StatefulWidget {
  final StudentModel studentModel;
  StudentRegister3({this.studentModel});

  @override
  _StudentRegister3State createState() => _StudentRegister3State();
}

class _StudentRegister3State extends State<StudentRegister3> {
  int _radioValue = 0; // radiovalue for level of education
  final _formKey = GlobalKey<FormState>();
  StudentModel currStudentModel1;
  String education =
      'Level Of Education'; // To store int radiobutton value in the DB as text
  TextEditingController educationController = TextEditingController();
  List<String> levels = [
    "Matric/ O levels",
    "Inter",
    "Undergraduate",
    "Postgraduate"
  ];

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          setState(() {
            education = 'Matric/O levels';
          });
          break;
        case 1:
          setState(() {
            education = 'Intermediate/ A levels';
          });
          break;
        case 2:
          setState(() {
            education = 'Undergraduate';
          });
          break;
        case 2:
          setState(() {
            education = 'Postgraduate';
          });
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
        padding: EdgeInsets.all(20),
        width: size.width,
        height: size.height,
        color: primaryColor,
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Choose your level of \nEducation',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                /*  Row(
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
                SizedBox(
                  height: 10,
                ),
                Row(
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
                SizedBox(
                  height: 10,
                ),
                Row(
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                      value: 4,
                    ),
                    Text(
                      'Postgraduate',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  ],
                ), */
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  items: levels.map((String level) {
                    return new DropdownMenuItem(
                        value: level,
                        child: Row(
                          children: <Widget>[
                            Text(level),
                          ],
                        ));
                  }).toList(),
                  onChanged: (newValue) {
                    // do other stuff with _category
                    setState(() => education = newValue);
                  },
                  value: education,
                  decoration: InputDecoration(
                    focusColor: Colors.white54,
                    contentPadding: EdgeInsets.fromLTRB(40, 20, 10, 20),
                    filled: true,
                    fillColor: Colors.white54,

                    // hintText: Localization.of(context).category,
                    //errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null
                  ),
                ),

//////////////////////////////////////////////

                SizedBox(
                  height: 40,
                ),
                Center(
                  child: CustomButton(
                    buttoncolor: buttonColor,
                    height: 50,
                    width: size.width / 2,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print("hogya");
                        print(education);
                        print(currStudentModel1);
                        print(currStudentModel1.firstname);

                        StudentModel _studentModel = StudentModel(
                          firstname: currStudentModel1.firstname,
                          lastname: currStudentModel1.lastname,
                          dob: currStudentModel1.dob,
                          gender: currStudentModel1.gender,
                          email: currStudentModel1.email,
                          phone: currStudentModel1.phone,
                          educationlevel: educationController.text,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentRegister5(
                                      studentModel: _studentModel,
                                    )));
                      } else {
                        CustomToast().showerrorToast(
                            "Please select your Level of Education");
                      }
                    },
                    title: 'NEXT',
                  ),
                )
              ]),
        ),
      )),
    );
  }
}
 */
