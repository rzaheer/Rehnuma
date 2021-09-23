import 'package:flutter/material.dart';

//Themedata
final Color primaryColor = Color(0xFF03A9AF);
final Color buttonTextColor = Color(0xFF413F3F);
final Color textColor = Colors.white;
final Color secondaryColor = Colors.white;
final Color highlightColor = Color(0xFF088185);
final Color inputTextColor = Color(0xFF024D61);
final Color buttonColor = Colors.red[900];
const kHintColor = Color(0xFF7F7F7F);

Size size(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return size;
}

/* const baseUrl = "http://10.0.2.2:8080/";
const baseUrlAllUni = "http://10.0.2.2:5000/"; */
const baseUrl = "https://uni-recommender.herokuapp.com/result";
const baseUrlAllUni =
    "https://get-universities.herokuapp.com/getAllUniversities";
//Color(0xFF#56E3E8),
const secretKey="sk_test_51JcvAkF9Ya0QnJFLOjIQaHIX0waWZjGEijqvqlTBfOKzx040wZjFBEdHoQ08bLWhz9tYBmB8eHlLAxsfEAqBDEmm00N7D7uJDV";