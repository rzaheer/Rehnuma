/* import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Login/Login.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/services/auth.dart';
import 'package:finalyearproject/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentRegister4 extends StatefulWidget {
  final StudentModel studentModel;
  StudentRegister4({this.studentModel});

  @override
  _StudentRegister4State createState() => _StudentRegister4State();
}

class _StudentRegister4State extends State<StudentRegister4> {
  int selectedIndex;

  final tags = [
    'Engineering',
    'Medical',
    'Fashion designing',
    'Computer Science',
    'Media & Arts'
  ];
  final image = [
    "assets/images/easy.png",
    "assets/images/jazzz.png",
    "assets/images/bankcards.png",
  ];
  final _formKey = GlobalKey<FormState>();

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
                      'Yay, Almost done! ',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.normal,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Choose tag that best \ndefines your interests',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.9,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 4,
                          ),
                          itemCount: tags.length,
                          itemBuilder: (BuildContext context, int i) {
                            return SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    setState(() {
                                      selectedIndex = i;
                                    });
                                  });
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => PaymentWebView()));

                                  //                     Navigator.push(
                                  // context,
                                  // MaterialPageRoute(
                                  //     builder: (context) => TestWebview()));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: selectedIndex == i
                                      ? inputTextColor
                                      : Colors.white54,
                                  elevation: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        tags[i],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Text(
                      'Other? Add here',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: size.width / 1.7,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            color: secondaryColor,
                          ),
                          focusColor: secondaryColor,
                          fillColor: Colors.white30,
                          filled: true,
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
                        onPressed: () async {
                          StudentModel reg1 = StudentModel(
                              dob: "3-07-1999",
                              email: "zahee123r@gmail.com",
                              firstname: "Zaheer",
                              gender: "male",
                              lastname: "Z",
                              password: "123456",
                              phone: "000");
                          await AuthService()
                              .registerWithEmailAndPassword(reg1, context)
                              .then((value) {
                            if (value == true) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Wrapper()),
                                  (Route<dynamic> route) => false);
                            } else {
                              CustomToast().showerrorToast("Failed");
                            }
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => StudentLogin()));
                        },
                        title: 'DONE',
                      ),
                    )
                  ]),
            )),
      ),
    );
  }
} */
