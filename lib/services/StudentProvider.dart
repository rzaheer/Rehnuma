import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:flutter/cupertino.dart';

class StudentProvider extends ChangeNotifier {
  StudentModel currStudent;

  setCurrentStudent(StudentModel studentModel) {
    currStudent = studentModel;
    notifyListeners();
  }
}
