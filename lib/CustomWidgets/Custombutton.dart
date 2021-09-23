import 'package:finalyearproject/Global.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.height,
    @required this.width,
    @required this.buttoncolor,
  }) : super(key: key);
  final String title;
  final void Function() onPressed;
  final double height;
  final double width;
  final Color buttoncolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        splashColor: Colors.white,
        highlightColor: highlightColor,
        disabledColor: buttonTextColor,
        focusColor: btnColor,
        elevation: 6,
        color: buttoncolor,
        // padding: const EdgeInsets.all(8.0),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
