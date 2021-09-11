import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/models/bookingModel.dart';
import 'package:flutter/cupertino.dart';

class UserDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference bookings =
      FirebaseFirestore.instance.collection("Bookings");

  Future createAppointmentdata(BookingModel bookingModel, int bookingId,
      BuildContext buildContext) async {
    return await firestore.doc(bookings.id).set({
      'mentorId': bookingModel.mentorId,
      'studentId': bookingModel.studentId,
      'bookingId': bookings.id,
      'slotTime': bookingModel.slotTime,
      'slotDate': bookingModel.slotDate,
      'fees': bookingModel.fees,
      'ratings': bookingModel.ratings,
    }).whenComplete(() {
      print('Appointmnt booked');
    });
  }
}
