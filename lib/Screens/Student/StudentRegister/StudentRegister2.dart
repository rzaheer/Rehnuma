import 'package:email_validator/email_validator.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister5.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:flutter/material.dart';

class StudentRegister2 extends StatefulWidget {
  final StudentModel studentModel;
  StudentRegister2({this.studentModel});

  @override
  _StudentRegister2State createState() => _StudentRegister2State();
}

class _StudentRegister2State extends State<StudentRegister2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  StudentModel currStudentModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currStudentModel = widget.studentModel;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final bool isValid = EmailValidator.validate(email);

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          width: size.width,
          height: size.height,
          color: primaryColor,
          child: SingleChildScrollView(
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
                      'How can we contact  \nyou?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: secondaryColor,
                          ),
                          focusColor: secondaryColor,
                          fillColor: Colors.white30,
                          filled: true,
                        ),
                        validator: (val) => val.isEmpty || isValid == false
                            ? 'Please provide valid Email'
                            : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFormField(
                        maxLength: 11,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: secondaryColor,
                          ),
                          focusColor: secondaryColor,
                          fillColor: Colors.white30,
                          filled: true,
                        ),
                        validator: (v) {
                          if (v.isEmpty || v.length < 11) {
                            return "Required";
                          } else
                            return null;
                        },
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
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print("hogya onn 2");
                            print(StudentModel);
                            print(currStudentModel.dob);
                            print(currStudentModel.firstname);
                            print(currStudentModel.gender);
                            print(currStudentModel.educationlevel);
                            print(currStudentModel.fieldOfEducation);
                            StudentModel _studentModel = StudentModel(
                              email: emailController.text,
                              phone: phoneController.text,
                              firstname: currStudentModel.firstname,
                              lastname: currStudentModel.lastname,
                              dob: currStudentModel.dob,
                              gender: currStudentModel.gender,
                              educationlevel: currStudentModel.educationlevel,
                              fieldOfEducation:
                                  currStudentModel.fieldOfEducation,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentRegister5(
                                          studentModel: _studentModel,
                                        )));
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
