import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/DoctorDetails.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:finalyearproject/services/bookingservice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  List<MentorModel> mentorList = [];
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
    "Career counselor/Psychologist",
    "Career advisor",
    "Psychologist"
  ];
  List<MentorModel> mentors=[];
  // getMentor()async{
  //   // setState(() {
  //   //       isLoading=true;
  //   //     });
  //   await DBService().getMentors().then((value) {
  //     setState(() {
  //             mentors=value;
  //             //isLoading=false;
  //           });
  //       print("lllllllllll");    
  //       print(mentors.length);    
    
  //   }
  //   ).catchError((e){
  //     print(e.toString());
  //     getMentor();

  //   });
  // }
  

  getAllMentors() async {
    await DBService().getMentorsList().then((value) {
      setState(() {
        mentorList = value;
      });
    });
    print("mentors arhy hain");
    print(mentorList.length);
  }

  @override
  void initState() {
    super.initState();

    getAllMentors();
  }

  TextEditingController searchcontroller = TextEditingController();
  String searchName;
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
        bottomNavigationBar: CustomNavbar(index: 0, indashboard: null),
        body: SingleChildScrollView(
          child: Container(
            color: secondaryColor,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'ALL COUNSELORS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: inputTextColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 8,
                      child: SizedBox(
                        width: size.width / 1.4,
                        height: 35,
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            FaIcon(
                              FontAwesomeIcons.search,
                              color: primaryColor,
                              size: 15,
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: size.width / 2,
                              child: TextFormField(
                                controller: searchcontroller,
                                style: TextStyle(
                                    fontSize: 14, color: buttonTextColor),

                                decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(fontSize: 14),
                                ),
                                onFieldSubmitted: (val) {
                                  setState(() {
                                    searchName = val;
                                  });
                                  print(searchName);
                                  //searchDoctor();
                                },
                                // onChanged: (val){
                                //   if(val.isEmpty){
                                //    fetchDoctors();
                                //   }
                                // },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 40,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.slidersH,
                          color: primaryColor,
                          size: 23,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: counselorname.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final professions = profession[index];
                      final details = counselorname[index];
                      return InkWell(
                        focusColor: primaryColor,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorDetails()));
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
                                    color: primaryColor,
                                    height: 100,
                                    width: 100,
                                    child: Icon(
                                      Icons.account_box,
                                      color: primaryColor,
                                      size: 50,
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      details,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: inputTextColor,
                                      ),
                                    ),
                                    Text(
                                      professions,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                        color: inputTextColor,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.star,
                                            size: 16, color: Colors.green),
                                        Icon(Icons.star,
                                            size: 16, color: Colors.green),
                                        Icon(Icons.star,
                                            size: 16, color: Colors.green),
                                        Icon(Icons.star,
                                            size: 16, color: Colors.green),
                                        Icon(Icons.star_half,
                                            size: 16, color: Colors.green),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 25,
                                      width: 120,
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
                                    ),

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
              ],
            ),
          ),
        ));
  }
}
