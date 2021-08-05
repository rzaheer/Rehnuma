class StudentModel {
  final String studentId;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final String password;
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
    this.password,
    this.gender,
    this.dob,
    this.educationlevel,
    this.fieldOfEducation,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel();

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "gender": gender,
        "dob": dob,
      };
}
