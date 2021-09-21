class SlotModel {
  final String slotId, day;
  final List mentorId;
  final DateTime timeSlot, endTime;
  SlotModel(
      {this.slotId, this.day, this.mentorId, this.endTime, this.timeSlot});
  factory SlotModel.fromMap(Map<String, dynamic> json) => SlotModel(
      slotId: json["slotId"],
      day: json["day"],
      mentorId: json["mentorId"],
      timeSlot: json["timeSlot"].toDate(),
      endTime: json["endTime"].toDate());
}
