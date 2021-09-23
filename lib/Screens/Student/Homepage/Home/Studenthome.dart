import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Loading.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/PaymentWebview.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/DoctorDetails.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/DoctorsList.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/DrawerItems/About.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/DrawerItems/Notifications.dart';
import 'package:finalyearproject/models/mentorModel.dart';

import 'package:finalyearproject/services/DBservice.dart';
import 'package:finalyearproject/services/PaymentServices.dart';
import 'package:finalyearproject/services/StudentProvider.dart';
import 'package:finalyearproject/services/auth.dart';
import 'package:finalyearproject/services/sharedFunctions.dart';
import 'package:finalyearproject/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  /*  Stream<Document> snapshot =
      FirebaseFirestore.instance.collection("Students").doc('').snapshots(); */

  String _uname = ''; //fetch user  full name
  String _uEmail = ''; //fetch user  full name
  var mCurrentUser = FirebaseAuth.instance.currentUser;
  FirebaseAuth _auth;
  DocumentReference ref;

  final counselorname = [
    "Dr. Moosa Khan",
    "Dr. Asim khurram",
    "Dr. Fayyaz",
    "Dr. Adeel Raza",
    "Dr. Ali Ilyas"
  ];
  final profession = [
    "Clinical Psychologist",
    "Career Coach",
    "Psychologist",
    "Career advisor",
    "Psychologist"
  ];
  List<MentorModel> mentorList = [];
  bool isLoading = true;

  getRatingRow(String rating) {
    List<Widget> row = List();
    for (int i = 0; i < 5; i++) {
      row.add(Icon(
        Icons.star,
        color: Colors.green,
        size: 16,
      ));
    }
  }

  var i;
  getAllmentorList() async {
    await DBService().getMentorsList().then((value) {
      setState(() {
        mentorList = value;
        isLoading = false;
      });
    });
    if (mentorList.length != 0) {
      print(mentorList.last.email);
    }
  }

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance; //auth iniatited
    _getCurrentUser(); //get user call
    getAllmentorList();
  }

  _getCurrentUser() async {
    mCurrentUser = _auth.currentUser;
    DocumentSnapshot item = await FirebaseFirestore.instance
        .collection("Students")
        .doc(mCurrentUser.uid)
        .get();

    setState(() {
      _uname = item['full name'];
    });
  }

  TextEditingController searchcontroller = TextEditingController();
  String searchName;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        actions: [
          /* Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.settings,
              color: secondaryColor,
              size: 27,
            ),
          ), */
          /*  Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                AuthService().signOut(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Wrapper()),
                    (Route<dynamic> route) => false);
              },
              icon: Icon(Icons.star),
            ),
          ) */
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Consumer<StudentProvider>(builder: (_, studentProv, __) {
              return UserAccountsDrawerHeader(
                accountName: Text(
                  studentProv.currStudent.firstname +
                      studentProv.currStudent.lastname,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                accountEmail: Text(studentProv.currStudent.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.android
                          ? secondaryColor
                          : primaryColor,
                  child: Text(
                    getInitials(studentProv.currStudent.firstname),
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              );
            }),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Notifications'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.envelopeOpen),
              title: Text('Invite Friends'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.infoCircle,
              ),
              title: Text('About the App'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Aboutus())); //
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.signOutAlt,
              ),
              title: Text('Log out'),
              onTap: () {
                AuthService().signOut(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Wrapper()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: true,
      drawerScrimColor: primaryColor,
      bottomNavigationBar: CustomNavbar(index: 0, indashboard: null),
      body: isLoading
          ? Loading()
          : Container(
              color: secondaryColor,
              child: ListView(
                padding: EdgeInsets.all(10),
                primary: true,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  // RaisedButton(onPressed: () async {

                  // }),
                  Text(
                    "Get the best career suggestions with our experts' guidance!",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10),

                  CarouselSlider(
                    items: [
                      //1st Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/banner1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      //2nd Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/banner2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      autoPlayCurve: Curves.easeInOut,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      viewportFraction: 1,
                    ),
                  ),
                  //,,,,,,,,,,,,,

                  SizedBox(height: 20),
                  Text(
                    "TOP PICKS OF THE MONTH",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: inputTextColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  //Top picks wala

                  /*     Firestore.instance.collection('DriverList').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) return new Text('Loading...');
    return new ListView(
      children: snapshot.data.documents.map((DocumentSnapshot document) {
        return new ListTile(
          title: new Text(document['name']),
          subtitle: new Text(document['phone']),
        );
      }).toList(),
    );
  },
); */
                  Container(
                    height: size.height / 5.1,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: mentorList.length,
                        itemBuilder: (context, index) {
                          final item = mentorList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoctorDetails(
                                          mentor: mentorList[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: size.width / 3.5,
                                height: size.height / 4.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.teal[50],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: mentorList[index].gender == 'Male'
                                          ? Image.asset(
                                              'assets/images/counselor.png',
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              'assets/images/femaledoc.png',
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 15),
                                      height: 50,
                                      child: Text(
                                        mentorList[index].fullName,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: inputTextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ), //Top picks wala
                  SizedBox(height: 20),
                  Text(
                    "ALL COUNSELORS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: inputTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: mentorList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorDetails(
                                          mentor: mentorList[index],
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.teal[50],
                              ),
                              height: size.height / 5.5,
                              width: size.width / 1.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    //color: primaryColor,
                                    height: 70,
                                    width: 70,
                                    child: mentorList[index].gender == 'Male'
                                        ? Image.asset(
                                            'assets/images/counselor.png',
                                            fit: BoxFit.fill,
                                          )
                                        : Image.asset(
                                            'assets/images/femaledoc.png',
                                            fit: BoxFit.fill,
                                          ),
                                    /* Icon(
                                        Icons.account_box,
                                        color: secondaryColor,
                                        size: 80,
                                      ) */
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${mentorList[index].fullName}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: inputTextColor,
                                        ),
                                      ),
                                      Text(
                                        mentorList[index].jobDesc,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontStyle: FontStyle.italic,
                                          color: inputTextColor,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '1000 PKR',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: buttonColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: getRatingRow(mentorList[index]
                                            .ratings
                                            .toString()),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      /* Container(
                                        height: 25,
                                        width: 120,
                                        // color: Colors.teal,
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Tap to view',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800],
                                              ),
                                            )),
                                      ), */

                                      /*  Positioned(
                                    bottom: 0,
                                    left: 10,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 20,
                                    )) */
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  Center(
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorList()));
                        },
                        child: Row(
                          children: [
                            Text(
                              'See more ',
                              style: TextStyle(
                                  color: inputTextColor, fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: inputTextColor,
                              size: 16,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
    );
  }
}
