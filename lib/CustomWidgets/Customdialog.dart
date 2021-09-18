import 'package:finalyearproject/Global.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String contentString;
  final String titleString;
  final Function okFunction;
  CustomDialog(
      {@required this.titleString,
      @required this.contentString,
      @required this.okFunction,
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
            onPressed: widget.okFunction,
            child: Text('OK',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 17,
                )))
      ],
    );
  }
}
