class SlotModel {
  final String slotId, day;
  final List mentorId;
  final DateTime startTime, endTime;
  SlotModel(
      {this.slotId, this.day, this.mentorId, this.endTime, this.startTime});
  factory SlotModel.fromMap(Map<String, dynamic> json) => SlotModel(
      slotId: json["slotId"],
      day: json["day"],
      mentorId: json["mentorId"],
      startTime: json["startTime"].toDate(),
      endTime: json["endTime"].toDate());
}
