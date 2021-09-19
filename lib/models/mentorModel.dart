class MentorModel {
  final String mentorId;
  final String cnic;
  final String firstName,fullName;
  final String jobDesc;
  final String email;
  final String fees;
  final int experience;
  final String education,phoneNumber;
  final int ratings;
  String gender;

  MentorModel({
    this.mentorId,
    this.cnic,
    this.firstName,this.fullName,
    this.email,
    this.jobDesc,
    this.fees,
    this.education,this.phoneNumber,
    this.experience,
    this.ratings,
    this.gender
  });

  //factory MentorModel.fromJson(Map<String, dynamic> json) => MentorModel();
    factory MentorModel.fromMap(Map<String, dynamic> json) {
    final MentorModel courseMod = MentorModel(
      mentorId: json["mentorId"],
      cnic: json["CNIC"],
      email: json["email"],
      firstName: json["firstName"],
      fullName: json["fullname"],
      fees: json["fees"],
      experience: json["experience"],
      jobDesc: json["jobDesc"] ,
      ratings: json["Ratings"],
      gender: json["gender"],
      education: json["education"],
      phoneNumber: json["phoneNumber"]
    );

    return courseMod;
  }



  Map<String, dynamic> toMap() => {
        "mentorId": mentorId,
        "firstName": firstName,
        "fullName":fullName,
        "jobDesc": jobDesc,
        "email": email,
        "fees": fees,
        "educatiion": education,
        "experience": experience,
        "ratings": ratings,
        "gender":gender
      };
}