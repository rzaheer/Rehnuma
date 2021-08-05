import 'package:flutter/material.dart';

//Themedata
final Color primaryColor = Color(0xFF03A9AF);
final Color buttonTextColor = Color(0xFF413F3F);
final Color textColor = Colors.white;
final Color secondaryColor = Colors.white;
final Color highlightColor = Color(0xFF088185);
final Color inputTextColor = Color(0xFF024D61);
final Color buttonColor = Color(0xFFCB1C1C);
const kHintColor = Color(0xFF7F7F7F);

Size size(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return size;
}

const baseUrl = "http://10.0.2.2:8080/";
const baseUrlAllUni = "http://10.0.2.2:5000/";
//Color(0xFF#56E3E8),
const kInputTextStyle = TextStyle(
  fontFamily: 'RalewayMedium',
  fontSize: 16,
);
var kInputHintTextStyle = kInputTextStyle.copyWith(
  color: kHintColor,
);
