// To parse this JSON data, do
//
//     final universityModel = universityModelFromMap(jsonString);

import 'dart:convert';

import 'package:finalyearproject/models/EngDeptModel.dart';
import 'package:finalyearproject/models/GenDeptModel.dart';
import 'package:finalyearproject/models/MedDeptModel.dart';

UniversityModel universityModelFromMap(String str) =>
    UniversityModel.fromMap(json.decode(str));

String universityModelToMap(UniversityModel data) => json.encode(data.toMap());

class UniversityModel {
  UniversityModel(
      {this.academicStaff,
      this.balochistan,
      this.campuses,
      this.distance,
      this.federal,
      this.femaleNonPhD,
      this.femalePhD,
      this.financialAid,
      this.grandTotal,
      this.hec,
      this.housing,
      this.islamabad,
      this.kpk,
      this.karachi,
      this.lahore,
      this.location,
      this.maleNonPhD,
      this.malePhD,
      this.maleToFemaleRatio,
      this.massCommunication,
      this.pec,
      this.pmdc,
      this.peshawar,
      this.postgraduateFees,
      this.private,
      this.province,
      this.public,
      this.punjab,
      this.sindh,
      this.studentToFacultyRatio,
      this.studentsEnrolled,
      this.type,
      this.undergraduateFees,
      this.university,
      this.years,
      this.index,
      this.isEngineering,
      this.isGeneral,
      this.isMedical,
      this.engDept,
      this.genDept,
      this.medDept});

  int academicStaff;
  int balochistan;
  String campuses;
  double distance;
  int federal;
  int femaleNonPhD;
  int femalePhD;
  int financialAid;
  int grandTotal;
  int hec;
  int housing;
  int islamabad;
  int kpk;
  int karachi;
  int lahore;
  String location;
  int maleNonPhD;
  int malePhD;
  double maleToFemaleRatio;
  int massCommunication;
  int pec;
  int pmdc;
  int peshawar;
  int postgraduateFees;
  int private;
  String province;
  int public;
  int punjab;
  int sindh;
  int studentToFacultyRatio;
  int studentsEnrolled;
  int type;
  int undergraduateFees;
  String university;
  int years;
  int index;
  bool isEngineering, isGeneral, isMedical;

  EngDeptModel engDept;
  GenDeptModel genDept;
  MedDeptModel medDept;
  factory UniversityModel.fromMap(Map<String, dynamic> json) => UniversityModel(
        academicStaff: json["Academic Staff"] ?? 0,
        balochistan: json["Balochistan"] ?? 0,
        campuses: json["Campuses"] ?? "",
        distance: json["Distance"].toDouble() ?? 0.0,
        federal: json["Federal"] ?? 0,
        femaleNonPhD: json["Female Non-PhD"] ?? 0,
        femalePhD: json["Female PhD"] ?? 0,
        financialAid: json["Financial Aid"] ?? 0,
        grandTotal: json["Grand Total"] ?? 0,
        hec: json["HEC"] ?? 0,
        housing: json["Housing"] ?? 0,
        islamabad: json["Islamabad"] ?? 0,
        kpk: json["KPK"] ?? 0,
        karachi: json["Karachi"] ?? 0,
        lahore: json["Lahore"] ?? 0,
        location: json["Location"] ?? "",
        maleNonPhD: json["Male Non-PhD"] ?? 0,
        malePhD: json["Male PhD"] ?? 0,
        maleToFemaleRatio: json["Male to Female Ratio"].toDouble() ?? 0.0,
        massCommunication: json["Mass Communication"] ?? 0,
        pec: json["PEC"] ?? 0,
        pmdc: json["PMDC"] ?? 0,
        peshawar: json["Peshawar"] ?? 0,
        postgraduateFees: json["Postgraduate fees"] ?? 0,
        private: json["Private"] ?? 0,
        province: json["Province"] ?? "",
        public: json["Public"] ?? 0,
        punjab: json["Punjab"] ?? 0,
        sindh: json["Sindh"] ?? 0,
        studentToFacultyRatio: json["Student to Faculty Ratio"] ?? 0,
        studentsEnrolled: json["Students Enrolled"] ?? 0,
        type: json["Type"] ?? 0,
        undergraduateFees: json["Undergraduate fees"] ?? 0,
        university: json["University"] ?? " ",
        years: json["Years"] ?? 0,
        index: json["index"] ?? 0,
        isEngineering: json["Type"] == 1 ? true : false,
        isGeneral: json["Type"] == 2 ? true : false,
        isMedical: json["Type"] == 3 ? true : false,
        engDept: json["Type"] == 1 ? EngDeptModel.fromMap(json) : null,
        genDept: json["Type"] == 2 ? GenDeptModel.fromMap(json) : null,
        medDept: json["Type"] == 3 ? MedDeptModel.fromMap(json) : null,
      );

  Map<String, dynamic> toMap() => {
        "Academic Staff": academicStaff,
        "Balochistan": balochistan,
        "Campuses": campuses,
        "Distance": distance,
        "Federal": federal,
        "Female Non-PhD": femaleNonPhD,
        "Female PhD": femalePhD,
        "Financial Aid": financialAid,
        "Grand Total": grandTotal,
        "HEC": hec,
        "Housing": housing,
        "Islamabad": islamabad,
        "KPK": kpk,
        "Karachi": karachi,
        "Lahore": lahore,
        "Location": location,
        "Male Non-PhD": maleNonPhD,
        "Male PhD": malePhD,
        "Male to Female Ratio": maleToFemaleRatio,
        "Mass Communication": massCommunication,
        "PEC": pec,
        "PMDC": pmdc,
        "Peshawar": peshawar,
        "Postgraduate fees": postgraduateFees,
        "Private": private,
        "Province": province,
        "Public": public,
        "Punjab": punjab,
        "Sindh": sindh,
        "Student to Faculty Ratio": studentToFacultyRatio,
        "Students Enrolled": studentsEnrolled,
        "Type": type,
        "Undergraduate fees": undergraduateFees,
        "University": university,
        "Years": years,
        "index": index,
      };
}
