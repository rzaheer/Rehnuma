import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customdialog.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/CustomWidgets/Loading.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/Studenthome.dart';
import 'package:finalyearproject/Screens/Student/Login/Login.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/services/auth.dart';
import 'package:flutter/material.dart';
import '../../../wrapper.dart';

class StudentRegister5 extends StatefulWidget {
  final StudentModel studentModel;
  StudentRegister5({this.studentModel});

  @override
  _StudentRegister5State createState() => _StudentRegister5State();
}

class _StudentRegister5State extends State<StudentRegister5> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  StudentModel currStudentModel;

  bool register = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currStudentModel = widget.studentModel;
  }

  String validatePassword(String value) {
    Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

  void ShowDialog() {
    if (register == true) {
      CustomDialog(
        buttonText: 'OK',
        contentString: 'Lets log into your account now.',
        titleString: "Welcome, ${currStudentModel.firstname}",
        button1Function: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Wrapper()),
              (Route<dynamic> route) => false);
        },
      );
    }
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
                      'Choose a password for \nyour account',
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
                      child: SizedBox(
                        height: 45,
                        width: size.width / 1.2,
                        child: TextFormField(
                          controller: passwordController,
                          style: TextStyle(fontSize: 16, color: inputTextColor),
                          obscureText: true,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white30,
                            hintText: 'New Password',
                          ),
                          validator: (value) {
                            if (validatePassword(value) != null) {
                              CustomToast().showerrorToast(
                                  "Password must contain numbers, upper case and lower case letters and special characters.");
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        height: 45,
                        width: size.width / 1.2,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          style: TextStyle(fontSize: 16, color: inputTextColor),
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white30,
                            hintText: 'Confirm Password',
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
                        onPressed: () async {
                          Loading();
                          if (_formKey.currentState.validate()) {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              print("hogyaaaaaaa validate");

                              print(currStudentModel.educationlevel);
                              print(currStudentModel.fieldOfEducation);

                              StudentModel _studentModel = StudentModel(
                                firstname: currStudentModel.firstname,
                                lastname: currStudentModel.lastname,
                                dob: currStudentModel.dob,
                                gender: currStudentModel.gender,
                                email: currStudentModel.email,
                                phone: currStudentModel.phone,
                                educationlevel: currStudentModel.educationlevel,
                                fieldOfEducation:
                                    currStudentModel.fieldOfEducation,
                              );
                              await AuthService()
                                  .registerWithEmailAndPassword(_studentModel,
                                      passwordController.text, context)
                                  .then((value) {
                                if (value == true) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext dialogContext) {
                                        return CustomDialog(
                                            buttonText: 'OK',
                                            contentString:
                                                'You have successfully registered on Rehnuma, Lets start this journey~',
                                            titleString: currStudentModel !=
                                                    null
                                                ? "Welcome, ${currStudentModel.firstname}😊"
                                                : "",
                                            button1Function: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StudentHome()),
                                                      (Route<dynamic> route) =>
                                                          false);
                                            });
                                      });
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => StudentHome()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  CustomToast().showerrorToast(
                                      "Email address is associated with another account");
                                }
                              });
                            } else {
                              CustomToast()
                                  .showerrorToast("Passwords donot match");
                            }
                          }
                          // AuthService().registerWithEmailAndPassword(
                          //     StudentModel(), context);
                        },
                        title: 'REGISTER',
                      ),
                    )
                  ]),
            )),
      ),
    );
  }
}
