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

  factory MentorModel.fromJson(Map<String, dynamic> json) => MentorModel();

  Map<String, dynamic> toJson() => {
        "mentorId": mentorId,
        "name": name,
        "jobDesc": jobDesc,
        "email": email,
        "fees": fees,
        "educatiion": education,
        "experience": experience,
        "ratings": ratings,
      };
}
