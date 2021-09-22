import 'package:email_validator/email_validator.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/CustomWidgets/Loading.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/ForgotPassword/Forgotpassword1.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/Studenthome.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister1.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/models/UniversityModel.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:finalyearproject/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class StudentLogin extends StatefulWidget {
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _authh;
  bool isUserSignedIn = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  StudentModel studentModel;
  String error = '';
  TextEditingController uniController = TextEditingController();

  String email = '';
  String password = '';
  List<String> allUnis = [];
  String selectedUni;
  DBService dbService = DBService();
  List<UniversityModel> allRecommendedUni = [];

  bool userSignedIn;

/*   ////////////////////////////
  Future<User> _handleSignIn() async {
    // hold the instance of the authenticated user
    User user;
    // flag to check whether we're signed in already
    bool isSignedIn = await _googleSignIn.isSignedIn();
    setState(() {
      isUserSignedIn = userSignedIn;
    });
    if (isSignedIn) {
      // if so, return the current user
      user = _authh.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = (await _authh.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  } */

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // bool load = false;
    final bool isValid = EmailValidator.validate(email);

    return Scaffold(
      body: loading == true
          ? Loading()
          : Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(30),
                  width: size.width,
                  height: size.height,
                  color: primaryColor,
                  child: Form(
                    key: _formKey,
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
                        Text('Email',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),

                        TextFormField(
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
                            hintText: 'username@yahoo.com',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                          ),
                          validator: (val) => val.isEmpty || isValid == false
                              ? 'Please provide valid Email'
                              : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
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
                        TextFormField(
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
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (val) => val.length < 6
                              ? 'Enter atleast 6 characters long password'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
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
                                onPressed: () async {
                                  print(email);
                                  print(password);
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                        await _auth.signInEmailPass(
                                            email, password, context);
                                    if (result != null) {
                                      setState(() {
                                        loading = true;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    StudentHome()));
                                      });
                                    }
                                  }
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
                                        builder: (context) =>
                                            ForgotPassword1()));
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
                              onPressed: () async {
                                await _auth.linkGoogle(studentModel, context);
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
                        /*  Center(
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
                  ), */
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StudentRegister()));
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
            ),
    );
  }
}
