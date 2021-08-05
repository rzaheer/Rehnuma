import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/models/UniversityModel.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:http/http.dart' as http;

class DBService {
  Future<List<UniversityModel>> getData(String uni) async {
    List<UniversityModel> _allUnis = [];
    //url for recommender
    String url = baseUrl + "result";

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
  }

  ///get All uni from this api
  Future<List<String>> getAllUni() async {
    List<String> _allUnis = [];
    //url for recommender
    String url = baseUrlAllUni + "getAllUniversities";

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
  /////////////////////////////
/* static Future<List<MentorModel>> _getMentorsList() async {
CollectionReference ref = FirebaseFirestore.instance.collection('Mentor');
QuerySnapshot eventsQuery = await ref
    .where("time", isGreaterThan: new DateTime.now().millisecondsSinceEpoch)
    .where("food", isEqualTo: true)
    .get();

HashMap<String, MentorModel> eventsHashMap = new HashMap<String, MentorModel>();

eventsQuery.documents.forEach((document) {
  eventsHashMap.putIfAbsent(document['id'], () => new MentorModel(
      name: document['name'],
       education: document['education'],
       email: document['email'],
       fees: document['fees'],
       experience: document['experience'],
       jobDesc: 
      ));
});

return eventsHashMap.values.toList();
} */
}
