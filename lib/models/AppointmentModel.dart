class AppointmentModel {
  String appointmentId, mentorId, studentId,slotId;
  DateTime startTime, endTime;

  bool isCompleted;

  AppointmentModel(
      {this.appointmentId,
      this.mentorId,
      this.studentId,
      this.slotId,
      this.endTime,
      this.startTime,
      this.isCompleted});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel();

  Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "mentorId": mentorId,
        "studentId": studentId,
        "endTime": endTime,
        "startTime": startTime,
        "isCompleted": isCompleted,
        "slotId":slotId
      };
}
