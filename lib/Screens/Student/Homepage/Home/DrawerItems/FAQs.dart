import 'package:flutter/material.dart';

import '../../../../../Global.dart';

class FAQS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        /* leading: Icon(
          Icons.menu,
          color: secondaryColor,
        ), */
        title: Text(
          'FAQs',
          style: TextStyle(
              fontSize: 17, color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: secondaryColor,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        color: secondaryColor,
      ),
    );
  }
}
