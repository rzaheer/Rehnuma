import 'package:intl/intl.dart';

String getInitials(String firstName) {
  return firstName[0].toUpperCase();
//    return firstName.trim()[0].toUpperCase() + lastName.trim()[0].toUpperCase();
}

String formatTime12Hr(DateTime dateTime) {
  String formattedTime = DateFormat('HH:mm').format(dateTime);
  return formattedTime;
}
