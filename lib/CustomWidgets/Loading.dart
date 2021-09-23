import 'package:flutter/material.dart';

import '../Global.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size(context).height,
      width: size(context).width,
      color: Colors.white,
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal[100]),
              backgroundColor: Colors.teal,
            ),
            SizedBox(
              height: 12,
            ),
            Text('Getting it ready for you..',
                style: TextStyle(fontSize: 14, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
