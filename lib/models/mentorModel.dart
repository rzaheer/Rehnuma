class MentorModel {
  final String mentorId;
  final String name;
  final String jobDesc;
  final String email;
  final String fees;
  final String experience;
  final String education;
  final int ratings;

  MentorModel({
    this.mentorId,
    this.name,
    this.email,
    this.jobDesc,
    this.fees,
    this.education,
    this.experience,
    this.ratings,
  });

  factory MentorModel.fromJson(Map<String, dynamic> json) => MentorModel(
        name: json["fullname"] ?? "",
        email: json["email"] ?? "",
        fees: json["fees"] ?? "",
        mentorId: json["mentorId"] ?? "",
        jobDesc: json["jobDesc"] ?? "",
        education: json["education"] ?? "",
        ratings: json["ratings"] ?? 0,
        experience: json["experience"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "mentorId": mentorId,
        "fullname": name,
        "jobDesc": jobDesc,
        "email": email,
        "fees": fees,
        "educatiion": education,
        "experience": experience,
        "ratings": ratings,
      };
}
