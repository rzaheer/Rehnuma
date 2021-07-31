import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/models/Registermodel.dart';

class DBuser {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  StudentModel reg1 = StudentModel(
      dob: "3-07-1999",
      email: "ishazaheer3@gmail.com",
      firstname: "Ramsha",
      gender: "male",
      lastname: "Z",
      password: "123",
      phone: "000");
  setData() async {
    await firestore.collection("Mentors").doc().set(reg1.toJson());
  }
}
