import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister2.dart';
import 'package:finalyearproject/models/Registermodel.dart';

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                        'Lets Start with the \nbasics',
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
                        // height: 45,
                        width: size.width / 1.2,
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
                                return "Please enter your first name";
                              } else
                                return null;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        height: 45,
                        width: size.width / 1.2,
                        child: TextField(
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
                        ),
                      ),
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
                      child: SizedBox(
                        height: 45,
                        width: size.width / 1.2,
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
                            return val == null ? 'Select date of birth' : null;
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
                            if (selectedGender != null) {
                              print("hogya");
                              StudentModel _studentModel = StudentModel(
                                firstname: fNameController.text,
                                lastname: lNameController.text,
                                dob: dobController.text,
                                gender: selectedGender,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudentRegister2(
                                            studentModel: _studentModel,
                                          )));
                            } else {
                              CustomToast()
                                  .showerrorToast("Please select a gender");
                            }
                          }
                          // AuthService().registerWithEmailAndPassword(context);
                        },
                        title: 'NEXT',
                      ),
                    )
                  ])),
        ),
      ),
    );
  }
}
