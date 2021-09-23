import 'package:flutter/material.dart';

import '../../../../../Global.dart';

class Aboutus extends StatelessWidget {
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
            'About us',
            style: TextStyle(
                fontSize: 18,
                color: secondaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            color: secondaryColor,
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("\n\nWhat is Rehnuma?",
                        style: TextStyle(
                            fontSize: 18,
                            color: primaryColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      " Rehnuma, an online platform that provides online career counseling to the students of every level and field. Career counseling is the need of the time because choosing right career is really necessary to work with passion. Our mission is to secure student’s future because career counseling will not only help you develop a wonderful personality, but it will also help you become more organized and a better person using different contemporary ways. It aids in the acquisition of the appropriate talent. Career counseling assists you in gaining concentration, which may genuinely show in our actions and job.",
                      style: TextStyle(
                        fontSize: 15,
                        color: inputTextColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
            )));
  }
}
