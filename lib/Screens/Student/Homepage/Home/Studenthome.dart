import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/DoctorDetails.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/DoctorsList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
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

  TextEditingController searchcontroller = TextEditingController();
  String searchName;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: secondaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.settings,
              color: primaryColor,
              size: 27,
            ),
          )
        ],
      ),
      drawerEnableOpenDragGesture: true,
      drawerScrimColor: primaryColor,
      drawer: Drawer(
        elevation: 8,
        child: ListView(children: [
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bell,
            ),
            title: Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.themeco,
            ),
            title: Text('App Theme'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.questionCircle,
            ),
            title: Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.question,
            ),
            title: Text('FAQs'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bug,
            ),
            title: Text('Report a problem'),
            onTap: () {},
          ),
        ]),
      ),
      bottomNavigationBar: CustomNavbar(index: 0, indashboard: null),
      body: Container(
        color: secondaryColor,
        child: ListView(
          padding: EdgeInsets.all(10),
          primary: true,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
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
            /* Row(
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
                            style:
                                TextStyle(fontSize: 14, color: buttonTextColor),

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
            ), */
            //,,,,,,,,,,,,,,,,,,,,,,
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
            Container(
              height: size.height / 5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: counselorname.length,
                  itemBuilder: (context, index) {
                    final item = counselorname[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorDetails()));
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
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/counselor.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Text(
                                  item,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15,
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
                itemCount: counselorname.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final professions = profession[index];
                  final details = counselorname[index];
                  return Padding(
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
                                size: 80,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                // color: Colors.teal,
                                child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DoctorDetails()));
                                    },
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
                  );
                }),
            Center(
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DoctorList()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'See more ',
                        style: TextStyle(color: inputTextColor, fontSize: 16),
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
