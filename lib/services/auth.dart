import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/models/user.dart';
import 'package:finalyearproject/services/DBuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      UserCredential result = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {});
      CustomToast().showsuccessToast("Login successful");
      return result;
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
      } else {
        CustomToast().showerrorToast('Oops, an error has occured');
      }
      print(error.toString());
      return error.message;
    } on PlatformException catch (error) {
      print("Platform Exception");
      CustomToast().showerrorToast('Oops, an error has occured');
      print(error.toString());
      return error.message;
    }
  }

  Future registerWithEmailAndPassword(
      StudentModel studentModel, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: studentModel.email, password: studentModel.password);
      // StudentModel studentModel = StudentModel(
      //     studentId: result.user.uid,
      //     dob: "3-07-1999",
      //     email: "ammar555@gmail.com",
      //     firstname: "Ammar555",
      //     gender: 0,
      //     lastname: "Z",
      //     password: "ammar123",
      //     phone: "000");
      if (result.user != null) {
        User firebaseUser = result.user;

        await students
            .doc(result.user.uid)
            .set(studentModel.toJson())
            .whenComplete(() {
          // Provider.of<UserDetailProvider>(context, listen: false)
          //     .setUserDetail(userDetail);
        });

        print("new user created hurray");
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

/*   GoogleSignInAccount googleUser = await googleSignIn.signIn();
GoogleSignInAuthentication googleAuth = await googleUser.authentication;
final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
);
FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;*/

//Google Sign in
  Future gsignIn(StudentModel studentModel, BuildContext context) async {
    GoogleSignInAccount googleSignInAccount = await googleSignin.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
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

  //googleSignout
  Future gsignOut() async {
    GoogleSignIn().signOut().whenComplete(() {
      print('Signed out succesfully');
    });
    return await _auth.signOut();
  }
}
