import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:flutter/material.dart';

class UniversityDetails extends StatelessWidget {
  final facilities = [
    "Air-conditioned classrooms",
    "Cafe",
    "Hockey ground",
    "Gymnasium for boys and girls",
    "Music academy",
    "Common rooms",
    "Photostat shops"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: primaryColor,
            ),
          ),
          elevation: 0,
          backgroundColor: secondaryColor,
        ),
        bottomNavigationBar: CustomNavbar(index: 1, indashboard: null),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: secondaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width / 1.6,
                            child: Text(
                              'NED University of Engineering and\nTechnology',
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: buttonColor,
                                  height: 1.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Karachi, Pakistan',
                              style: TextStyle(
                                fontSize: 15,
                                color: buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/university.png",
                          height: 90,
                          width: 80,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('A short description or introduction',
                      style: TextStyle(
                        fontSize: 16,
                        color: inputTextColor,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('PROGRAMS OFFERED',
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Programs offered to be mentioned here',
                      style: TextStyle(
                        fontSize: 13,
                        color: inputTextColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('FEE STRUCTURE',
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      '25,000PKR for B.E. Programs\n35,000PKR for B.S. Programs',
                      style: TextStyle(
                        fontSize: 14,
                        color: inputTextColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('FACILITIES ',
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: facilities.length,
                        itemBuilder: (context, index) {
                          final item = facilities[index];
                          return Row(
                            children: [
                              Icon(
                                Icons.check_box,
                                color: primaryColor,
                                size: 14,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(item,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: inputTextColor,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          );
                        }),
                  )

                  //shasghdgs
                ],
              ),
            ),
          ),
        ));
  }
}
