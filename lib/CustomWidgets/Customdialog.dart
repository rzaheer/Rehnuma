import 'package:finalyearproject/Global.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String contentString;
  final String titleString;
  final Function button1Function;

  final String buttonText;

  CustomDialog(
      {@required this.titleString,
      @required this.contentString,
      @required this.button1Function,
      //this.button2Function,
      @required this.buttonText,
      Key key})
      : super(key: key);
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Text(widget.contentString,
          style: TextStyle(color: Colors.black, fontSize: 15)),
      title: Text(widget.titleString,
          style: TextStyle(color: Colors.green[800], fontSize: 18)),
      actions: [
        FlatButton(
            onPressed: widget.button1Function,
            child: Text(widget.buttonText,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 17,
                ))),
        // FlatButton(
        //     onPressed: widget.button2Function,
        //     child: Text(widget.button2Text,
        //         style: TextStyle(
        //           color: primaryColor,
        //           fontSize: 17,
        //         ))),
      ],
    );
  }
}
