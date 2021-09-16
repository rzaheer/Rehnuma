import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/models/UniversityModel.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:finalyearproject/models/slotModel.dart';
import 'package:http/http.dart' as http;

class DBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('Students');
  /* Future<List<UniversityModel>> getData(String uni) async {
    List<UniversityModel> _allUnis = [];
    //url for recommender
    String url = baseUrl;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll({"Content-type": "multipart/form-data"});
    request.fields['uni'] = uni;

    try {
      var res = await request.send();
      var _response = await http.Response.fromStream(res);
      if (_response.statusCode == 200) {
        print("Succesfull");
        var jBody = JsonDecoder().convert(_response.body);
        for (var uni in jBody) {
          UniversityModel model = UniversityModel.fromJson(uni);
          // _allUnis.removeWhere((element) => element.campuses.contains('NaN'));
          _allUnis.add(model);
        }
        print(jBody);

        return _allUnis;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  } */

  // Future getSlotsList() async {
  //   CollectionReference slotRef = _db.collection('Slots');
  //   List<MentorModel> _allMentors = [];
  //   try {
  //     QuerySnapshot qs = await slotRef.get();
  //     qs.docs.forEach((q) {
  //       print(q.data());
  //     });
  //   } catch (e) {
  //     print("Error in mentor get list: " + e.toString());
  //   }
  // }

  Future<List<UniversityModel>> getData(String university) async {
    List<UniversityModel> _allUnis = [];
    //url for recommender
    String url = "https://uni-recommender.herokuapp.com/result";

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll({"Content-type": "multipart/form-data"});
    request.fields['uni'] = university;

    try {
      var res = await request.send();
      var _response = await http.Response.fromStream(res);
      print("Executing");
      print(_response.statusCode);
      if (_response.statusCode == 200) {
        print("Succesfull");
        var jBody = JsonDecoder().convert(_response.body);
        for (var uni in jBody) {
          UniversityModel model = UniversityModel.fromMap(uni);
          _allUnis.add(model);
        }
      } else {
        print(_response.statusCode);
      }
      return _allUnis;
    } catch (e) {
      print(e.toString());
      return _allUnis;
    }
  }

  ///get All uni from this api
  Future<List<String>> getAllUni() async {
    List<String> _allUnis = [];
    //url for recommender
    String url = baseUrlAllUni;

    var request = http.MultipartRequest('GET', Uri.parse(url));

    request.headers.addAll({"Content-type": "multipart/form-data"});

    try {
      var res = await request.send();
      var _response = await http.Response.fromStream(res);
      if (_response.statusCode == 200) {
        print("Succesfull");
        var jBody = JsonDecoder().convert(_response.body);
        for (var uni in jBody) {
          _allUnis.add(uni);
        }
        return _allUnis;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

/*  Future<void> getMentorsList() {
    return _db
        .collection('Mentor').get()
  }
 */

  Future<List<MentorModel>> getMentorsList() async {
    CollectionReference mentorRef = _db.collection('Mentor');
    List<MentorModel> _allMentors = [];
    try {
      QuerySnapshot qs = await mentorRef.get();
      _allMentors = qs.docs
          .map((DocumentSnapshot doc) => MentorModel.fromJson(doc.data()))
          .toList();
      print("Length of mentors: ");
      print(_allMentors.length);
      return _allMentors;
    } catch (e) {
      print("Error in mentor get list: " + e.toString());
      return _allMentors;
    }
  }

  Future<List<SlotModel>> getSlotsList() async {
    CollectionReference slotRef = _db.collection('Slots');

    List<SlotModel> _allSlots = [];
    try {
      QuerySnapshot qs = await slotRef.get();
      _allSlots = qs.docs
          .map((DocumentSnapshot doc) => SlotModel.fromMap(doc.data()))
          .toList();

      return _allSlots;
    } catch (e) {
      print("Error in mentor get list: " + e.toString());
      return _allSlots;
    }
  }

  ////////////////////
  Future<StudentModel> getStudentByUid(String uid) async {
    try {
      DocumentSnapshot doc = await studentCollection.doc(uid).get();
      if (doc != null) {
    
        StudentModel student = StudentModel.fromJson(doc.data());
     
        return student;
      } else {
        return null;
      }
    } catch (e) {
      print("Error: " + e.toString());
      return null;
    }
  }
}
