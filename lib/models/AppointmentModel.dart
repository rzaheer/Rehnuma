class AppointmentModel {
  String appointmentId, mentorId, studentId, slotId, mentorName,studentName;
  DateTime startTime, endTime;

  bool isCompleted, paymentReceived,activateChat;

  AppointmentModel(
      {this.appointmentId,
      this.mentorId,
      this.studentId,
      this.slotId,
      this.mentorName,
      this.endTime,
      this.startTime,
      this.isCompleted,
      this.paymentReceived,
      this.activateChat,
      this.studentName
      });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
          appointmentId: json["appointmentId"],
          mentorId: json["mentorId"],
          slotId: json["slotId"],
          studentId: json["studentId"],
          endTime: json["endTime"].toDate(),
          startTime: json["startTime"].toDate(),
          isCompleted: json["isCompleted"],
          mentorName: json["mentorName"],
          paymentReceived: json["paymentReceived"],
          activateChat: json["activateChat"],
          studentName: json["studentName"]
          );

  Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "mentorId": mentorId,
        "studentId": studentId,
        "endTime": endTime,
        "startTime": startTime,
        "isCompleted": isCompleted,
        "slotId": slotId,
        "mentorName": mentorName,
        "paymentReceived": paymentReceived,
        "activateChat":activateChat,
        "studentName":studentName
      };
}
