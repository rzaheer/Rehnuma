class MentorModel {
  final String mentorId;
  final String cnic;
  final String firstName, fullName;
  final String jobDesc;
  final String email;
  final String fees;
  final String experience;
  final String education, phoneNumber;
  final int ratings;
  String gender;
  List slots;
  MentorModel(
      {this.mentorId,
      this.cnic,
      this.firstName,
      this.fullName,
      this.email,
      this.jobDesc,
      this.fees,
      this.education,
      this.phoneNumber,
      this.experience,
      this.ratings,
      this.slots,
      this.gender});

  //factory MentorModel.fromJson(Map<String, dynamic> json) => MentorModel();
  factory MentorModel.fromMap(Map<String, dynamic> json) {
    final MentorModel courseMod = MentorModel(
        mentorId: json["mentorId"],
        cnic: json["cnic"],
        email: json["email"],
        firstName: json["firstName"],
        fullName: json["fullname"],
        fees: json["fees"],
        experience: json["expYears"],
        jobDesc: json["jobDesc"],
        ratings: json["Ratings"],
        gender: json["gender"],
        education: json["education"],
        slots: json["slots"] ?? [],
        phoneNumber: json["phone"]);

    return courseMod;
  }

  Map<String, dynamic> toMap() => {
        "mentorId": mentorId,
        "firstName": firstName,
        "fullname": fullName,
        "jobDesc": jobDesc,
        "email": email,
        "fees": fees,
        "educatiion": education,
        "expYears": experience,
        "ratings": ratings,
        "gender": gender
      };
}
