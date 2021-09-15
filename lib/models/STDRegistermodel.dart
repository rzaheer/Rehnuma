class StudentModel {
  final String studentId;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;

  final String gender;
  final String dob;
  final String educationlevel;
  final String fieldOfEducation;

  StudentModel({
    this.studentId,
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
    this.gender,
    this.dob,
    this.educationlevel,
    this.fieldOfEducation,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
      studentId: json["studentId"] ?? "",
      firstname: json["firstname"] ?? "",
      lastname: json["lastname"] ?? "",
      gender: json["gender"] ?? "",
      dob: json["dob"] ?? "",
      educationlevel: json["educationlevel"] ?? "",
      email: json["email"] ?? "",
      fieldOfEducation: json["fieldOfEducation"] ?? "",
      phone: json["phone"] ?? "");

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "gender": gender,
        "dob": dob,
        "educationlevel": educationlevel,
        "fieldofeducation": fieldOfEducation
      };
}
