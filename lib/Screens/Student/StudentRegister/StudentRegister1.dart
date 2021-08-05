import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister2.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class StudentRegister extends StatefulWidget {
  @override
  _StudentRegisterState createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  TextEditingController dobController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final format = DateFormat("dd-MM-yyyy");
  DateTime selectedDate = DateTime.now();
  bool maleSelected = true, femaleSelected = false, otherSelected = false;
  String gender; //1 for female , 2 for male , 3 for other
  String selectedGender;
  final _formKey = GlobalKey<FormState>();
  String education = 'Level Of Education';
  // To store dropdown value in the DB as text
  String field = 'Field Of Education';
  // To store dropdown value in the DB as text
  List<String> levels = [
    "Matric/O levels",
    "Inter",
    "Undergraduate",
    "Postgraduate"
  ];
  List<String> fields = [
    "Medical Sciences",
    "Engineering",
    "IT and Computer Science",
    "Business and Finance",
    "Media and Arts",
    "Law",
  ];

  void _handleRadioValueChange(String value) {
    setState(() {
      selectedGender = value;
    });
    print(selectedGender);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.all(20),
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
                    Text(
                      'Tell us about yourself',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.normal,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: TextFormField(
                          controller: fNameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              color: secondaryColor,
                            ),
                            focusColor: secondaryColor,
                            fillColor: Colors.white30,
                            filled: true,
                          ),
                          validator: (v) {
                            if (v.isEmpty) {
                              return "Please Enter Your First Name";
                            } else
                              return null;
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFormField(
                          controller: lNameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                              color: secondaryColor,
                            ),
                            focusColor: secondaryColor,
                            fillColor: Colors.white30,
                            filled: true,
                          ),
                          validator: (v) {
                            if (v.isEmpty) {
                              return "Required";
                            } else
                              return null;
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            groupValue: selectedGender,
                            onChanged: _handleRadioValueChange,
                            value: "male",
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          Radio(
                            groupValue: selectedGender,
                            value: "female",
                            onChanged: _handleRadioValueChange,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          Radio(
                            groupValue: selectedGender,
                            onChanged: _handleRadioValueChange,
                            value: "other",
                          ),
                          Text(
                            'Other',
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
                      child: DateTimeField(
                        controller: dobController,
                        onChanged: (value) {
                          setState(() {
                            selectedDate = value;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white30,
                            filled: true,
                            focusColor: primaryColor,
                            hintStyle: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              color: secondaryColor,
                            ),
                            hintText: 'Date Of Birth',
                            errorStyle: TextStyle(
                              color: buttonColor,
                            )),
                        validator: (val) {
                          return val == null ? 'Required' : null;
                        },
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: DropdownButtonFormField(
                        hint: Text(
                          'Level Of Education',
                          style: TextStyle(color: secondaryColor),
                        ),
                        items: levels.map((String value) {
                          return new DropdownMenuItem(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  Text(value),
                                ],
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() => education = newValue);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          filled: true,
                          fillColor: Colors.white30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: DropdownButtonFormField(
                        hint: Text(
                          'Field Of Education',
                          style: TextStyle(color: secondaryColor),
                        ),
                        items: fields.map((String field) {
                          return new DropdownMenuItem(
                              value: field,
                              child: Row(
                                children: <Widget>[
                                  Text(field),
                                ],
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() => field = newValue);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          filled: true,
                          fillColor: Colors.white30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: CustomButton(
                        height: 50,
                        buttoncolor: buttonColor,
                        width: size.width / 2,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (selectedGender != null &&
                                education != null &&
                                field != null) {
                              print("hogya");
                              print(education);
                              print(field);
                              print(StudentModel);
                              StudentModel _studentModel = StudentModel(
                                firstname: fNameController.text,
                                lastname: lNameController.text,
                                gender: selectedGender,
                                dob: dobController.text,
                                educationlevel: education,
                                fieldOfEducation: field,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudentRegister2(
                                            studentModel: _studentModel,
                                          )));
                            } else {
                              CustomToast()
                                  .showerrorToast("Please fill all fields");
                            }
                            AuthService().registerWithEmailAndPassword(
                                StudentModel(), context);
                          }
                        },
                        title: 'NEXT',
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}
