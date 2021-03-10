import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Recommender/SearchResult.dart';
import 'package:flutter/material.dart';

class Recommender extends StatefulWidget {
  @override
  _RecommenderState createState() => _RecommenderState();
}

class _RecommenderState extends State<Recommender> {
  TextEditingController searchcontroller = TextEditingController();
  String searchName;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: secondaryColor,
      ),
      bottomNavigationBar: CustomNavbar(index: 1, indashboard: null),
      body: SingleChildScrollView(
        child: Container(
          color: secondaryColor,
          width: size.width,
          height: size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Confused over university\nselection?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.normal,
                      color: inputTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/images/recommenderlogo.jpg',
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Enter the name of your desired university',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: primaryColor,
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    width: size.width / 1.3,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          height: 50,
                          width: size.width / 2,
                          child: TextFormField(
                            controller: searchcontroller,

                            style: TextStyle(
                              fontSize: 17,
                              color: buttonTextColor,
                            ),

                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Type...',
                              hintStyle: TextStyle(fontSize: 17),
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
                        Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: buttonColor,
                          ),
                          child: IconButton(
                              color: buttonColor,
                              icon: Icon(
                                Icons.search,
                                color: secondaryColor,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchResults()));
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    );
  }
}
