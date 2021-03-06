import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/CustomWidgets/Customdialog.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/Studenthome.dart';
import 'package:finalyearproject/Screens/Student/StudentRegister/StudentRegister1.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/models/user.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:finalyearproject/services/StudentProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignin = new GoogleSignIn();
  final fireStore = FirebaseFirestore.instance;
  final CollectionReference students =
      FirebaseFirestore.instance.collection("Students");
  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(user.uid) : null;
  }

  Stream<AppUser> get user {
    return _auth
        .authStateChanges()
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  Future signInEmailPass(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCreds = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      String uid = userCreds.user.uid;
      if (userCreds != null) {
        await DBService().getStudentByUid(uid).then((student) {
          StudentProvider studentProvider =
              Provider.of<StudentProvider>(context, listen: false);
          studentProvider.setCurrentStudent(student);
          CustomToast().showsuccessToast("Login successful");
        });
      }

      return userCreds;
    } on FirebaseAuthException catch (error) {
      print("firebase aUTH eXCePTION ayaaaa hai");

      if (error.code == 'user-not-found') {
        CustomToast().showerrorToast('User not found');
      } else if (error.code == 'wrong-password') {
        CustomToast().showerrorToast('Invalid password');
      } else if (error.code == 'network-request-failed') {
        CustomToast().showerrorToast('Network error occured');
      } else if (error.code == 'invalid-email') {
        CustomToast().showerrorToast('Invalid Email');
      } else if (error.code == 'wrong-password') {
        CustomToast().showerrorToast(error.message);
      } else {
        CustomToast().showerrorToast('Oops, an error has occured');
      }
      print(error.toString());
      return null;
    } on PlatformException catch (error) {
      print("Platform Exception");
      CustomToast().showerrorToast('Oops, an error has occured');
      print(error.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      StudentModel studentModel, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: studentModel.email, password: password);

      if (result.user != null) {
        StudentModel newStudent = StudentModel(
          firstname: studentModel.firstname,
          lastname: studentModel.lastname,
          dob: studentModel.dob,
          educationlevel: studentModel.educationlevel,
          fieldOfEducation: studentModel.fieldOfEducation,
          gender: studentModel.gender,
          phone: studentModel.phone,
          studentId: result.user.uid,
          email: studentModel.email,
        );
        print("new user created");
        print("The new created UID of auth user is " + result.user.uid);
        print("The new created UID of student is " + newStudent.studentId);
        print("The new created email is " + result.user.email);
        await students
            .doc(result.user.uid)
            .set(newStudent.toJson())
            .then((value) async {
          await DBService().getStudentByUid(result.user.uid).then((student) {
            StudentProvider studentProvider =
                Provider.of<StudentProvider>(context, listen: false);
            studentProvider.setCurrentStudent(student);
          });
        });

        return true;
      } else {
        return null;
      }
    } catch (error) {
      print(error.message);
      return null;
    }
  }

  /// README: sign out
  Future signOut(BuildContext context) async {
    try {
      await _auth.signOut().whenComplete(() {
        /* Provider.of<UserDetailProvider>(context, listen: false)
            .clearUserDetail(); */
      });
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  /* setProvider(user, BuildContext context) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection("Users");
    var u = await users.doc(user.uid).get();
    UserDetModel userDetModel = UserDetModel(
        userID: u.data()["userUid"],
        firstName: u.data()["firstName"],
        lastName: u.data()["lastName"],
        email: u.data()["email"]);
    print(u.data()["firstName"]);
    print(userDetModel.firstName);
    await Provider.of<UserDetailProvider>(context, listen: false)
        .setUserDetail(userDetModel);
  } */

  Future passwordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      CustomToast().showsuccessToast('Reset link sent');
    } catch (e) {
      CustomToast().showerrorToast('Oops! An error has occured');
      return null;
    }
  }

//Google sign in new
  Future<void> linkGoogle(
      StudentModel studentModel, BuildContext context) async {
    // Trigger the Google Authentication flow.
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential.
    final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google [UserCredential].
    final UserCredential googleUserCredential =
        await FirebaseAuth.instance.signInWithCredential(googleCredential);
    final User user = googleUserCredential.user;

    if (googleUserCredential.user != null) {
      User firebaseUser = googleUserCredential.user;
      StudentModel newStudent = StudentModel(
        firstname: user.displayName,
        lastname: studentModel.lastname,
        dob: studentModel.dob,
        educationlevel: studentModel.educationlevel,
        fieldOfEducation: studentModel.fieldOfEducation,
        gender: studentModel.gender,
        phone: user.phoneNumber,
        studentId: googleUserCredential.user.uid,
        //password: studentModel.password,
        email: user.email,
      );
      showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return CustomDialog(
                buttonText: 'OK',
                contentString:
                    'You have successfully registered on Rehnuma, Lets start this journey~',
                titleString: newStudent != null
                    ? "Welcome, ${newStudent.firstname}????"
                    : "",
                button1Function: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => StudentRegister()),
                      (Route<dynamic> route) => false);
                });
          });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => StudentRegister()),
          (Route<dynamic> route) => false);
      print(firebaseUser.email);

      print("User Email:${user.email}");
      print('User password: ${user.displayName}');
      print('User password: ${user.metadata}');

      return _userFromFirebaseUser(user);
    } else {
      print('Sign in failed');
    }
  }
//

//Google Sign in - old
  Future gsignIn(StudentModel studentModel, BuildContext context) async {
    GoogleSignInAccount googleSignInAccount = await googleSignin.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    final UserCredential googleUserCredential =
        await FirebaseAuth.instance.signInWithCredential(googleCredential);
    final User user = authResult.user;
    if (authResult.user != null) {
      User firebaseUser = authResult.user;
      print(firebaseUser.email);

      print("User Name:${user.email}");
      return _userFromFirebaseUser(user);
    } else {
      print('Sign in failed');
    }
  }

//
  //googleSignout
  Future gsignOut() async {
    GoogleSignIn().signOut().whenComplete(() {
      print('Signed out succesfully');
    });
    return await _auth.signOut();
  }
}
