class BookingModel {
  final int bookingId;
  final int mentorId;
  final int studentId;
  final String slotTime;
  final String slotDate;
  final String fees;
  final int ratings;

  BookingModel({
    this.bookingId,
    this.mentorId,
    this.studentId,
    this.slotTime,
    this.slotDate,
    this.fees,
    this.ratings,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel();

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "mentorId": mentorId,
        "studentId": studentId,
        "jslotTime": slotTime,
        "slotDate": slotDate,
        "fees": fees,
        "ratings": ratings,
      };
}
