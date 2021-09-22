import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/models/STDRegistermodel.dart';
import 'package:finalyearproject/models/UniversityModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

class UniversityDetails extends StatefulWidget {
  final UniversityModel uniDetails;
  UniversityDetails({this.uniDetails});

  @override
  _UniversityDetailsState createState() => _UniversityDetailsState();
}

class _UniversityDetailsState extends State<UniversityDetails> {
  final facilities = [
    "Air-conditioned classrooms",
    "Cafe",
    "Hockey ground",
    "Gymnasium for boys and girls",
    "Music academy",
    "Common rooms",
    "Photostat shops"
  ];

  UniversityModel currUniModel;

  bool _financialAid = false;

  @override
  void initState() {
    super.initState();
    currUniModel = widget.uniDetails;
    print(widget.uniDetails.university);
    print(currUniModel.campuses);
    print(currUniModel.pmdc);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int undergrad = currUniModel.undergraduateFees;
    int postgrad = currUniModel.postgraduateFees;
    Map<String, double> femaleRatio = {
      "Female PhD": currUniModel.femalePhD.toDouble() < 4.0
          ? 4.0
          : currUniModel.femalePhD.toDouble(),
      "Female Non-PhD": currUniModel.femaleNonPhD.toDouble() < 4.0
          ? 4.0
          : currUniModel.femaleNonPhD.toDouble(),
      "Male PhD": currUniModel.malePhD.toDouble() < 4.0
          ? 4.0
          : currUniModel.malePhD.toDouble(),
      "Male Non-PhD": currUniModel.maleNonPhD.toDouble() < 4.0
          ? 4.0
          : currUniModel.maleNonPhD.toDouble(),
    };

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
          child: Container(
            padding: const EdgeInsets.all(20.0),
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
                            width: size.width / 1.5,
                            child: Text(
                              currUniModel.university,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.teal[700],
                                  height: 1.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              currUniModel.location +
                                  ", " +
                                  currUniModel.province,
                              style: TextStyle(
                                fontSize: 16,
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
                  Text('PROGRAMS OFFERED',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  currUniModel.isEngineering == true
                      ? Text(
                          'Engineering programs in Mechanical, Electrical, IT, Chemical are offered at ' +
                              currUniModel.university)
                      : (currUniModel.isMedical == true
                          ? Text(
                              'Programs of MBBS, BDS, Doctorate of Pharmacy and Physiology are offered at ' +
                                  currUniModel.university)
                          : Text(
                              'All general programs including Media Sciences, Mass Commmunication, Agriculture, Mathematics, Industrial Chemistry and much more are offered at ' +
                                  currUniModel.university)),

                  Text('UNIVERSITY TYPE',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      currUniModel.isEngineering == true
                          ? Text('Engineering,',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ))
                          : (currUniModel.isGeneral == true
                              ? Text('General,',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ))
                              : Text('Medical,',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ))),
                      currUniModel.private == 1
                          ? Text('Private University',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ))
                          : Text('Public University',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('CAMPUSES',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(currUniModel.campuses,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('FEE STRUCTURE',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(undergrad.toString() + " PKR",
                          style: TextStyle(
                            fontSize: 14,
                            color: buttonColor,
                          )),
                      Text("/year",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                      Text(" (Undergraduate Programs)",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(postgrad.toString() + " PKR",
                          style: TextStyle(
                            fontSize: 14,
                            color: buttonColor,
                          )),
                      Text("/year",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                      Text(" (Postgraduate Programs)",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('STUDENT POPULATION',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Approximate ' + currUniModel.studentsEnrolled.toString(),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('FACULTY RATIO',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: PieChart(
                      dataMap: femaleRatio,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: size.width / 3,
                      colorList: [
                        Colors.teal[100],
                        Colors.teal[200],
                        Colors.teal[300],
                        Colors.teal[400],
                      ],
                      decimalPlaces: 2,
                      initialAngle: 60,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
                      chartValueFontSize: 10,
                      legendFontSize: 12,
                    ),
                  ),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Female PhDs: ' + currUniModel.femalePhD.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                          'Female non-PhDs: ' +
                              currUniModel.femaleNonPhD.toString(),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  /*  SizedBox(
                    height: 20,
                  ), */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Male PhDs: ' + currUniModel.malePhD.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                          'Male non-PhDs: ' +
                              currUniModel.maleNonPhD.toString(),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ), */
                  SizedBox(
                    height: 10,
                  ),
                  Text('FACILITIES ',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            activeColor: currUniModel.financialAid == 1
                                ? Colors.green
                                : Colors.grey,
                            focusColor: Colors.pink,
                            checkColor: Colors.white,
                            value: currUniModel.financialAid == 1 ? true : null,
                            onChanged: (value) {
                              if (currUniModel.financialAid == 1) value = true;
                            },
                          ),
                          Text('Financial Aid',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      ////2nd
                      Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            activeColor: currUniModel.housing == 1
                                ? Colors.green
                                : Colors.grey,
                            focusColor: Colors.pink,
                            checkColor: Colors.white,
                            value: currUniModel.housing == 1 ? true : null,
                            onChanged: (value) {
                              if (currUniModel.housing == 1) value = true;
                            },
                          ),
                          Text('Hostels/Staff Residence',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ],
                  ),
                  //2nd row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            activeColor: Colors.green,
                            focusColor: Colors.pink,
                            checkColor: Colors.white,
                            value: true,
                            onChanged: (value) {
                              value = true;
                            },
                          ),
                          Text('Sports/Games',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      ////2nd
                      Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            activeColor: Colors.green,
                            focusColor: Colors.pink,
                            checkColor: Colors.white,
                            value: true,
                            onChanged: (value) {
                              value = true;
                            },
                          ),
                          Text('Canteen/Cafes',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('ACCREDITATIONS ',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),

                  (currUniModel.isEngineering == true && currUniModel.pec == 1)
                      ? Row(
                          children: [
                            Text('PEC Recognized  ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            currUniModel.pec == 1
                                ? FaIcon(
                                    FontAwesomeIcons.check,
                                    color: Colors.green,
                                    size: 18,
                                  )
                                : FaIcon(FontAwesomeIcons.times,
                                    color: Colors.red, size: 18),
                          ],
                        )
                      : ((currUniModel.isMedical == true &&
                              currUniModel.pmdc == 1)
                          ? Row(
                              children: [
                                Text('PMDC Recognized  ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                currUniModel.pec == 1
                                    ? FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 18,
                                      )
                                    : FaIcon(FontAwesomeIcons.times,
                                        color: Colors.red, size: 18),
                              ],
                            )
                          : (currUniModel.isGeneral == true &&
                                  currUniModel.hec == 1)
                              ? Row(
                                  children: [
                                    Text('HEC Recognized  ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    currUniModel.pec == 1
                                        ? FaIcon(
                                            FontAwesomeIcons.check,
                                            color: Colors.green,
                                            size: 18,
                                          )
                                        : FaIcon(FontAwesomeIcons.times,
                                            color: Colors.red, size: 18),
                                  ],
                                )
                              : Container()),
                ]),
          ),
        ));
  }
}
