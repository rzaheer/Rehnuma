import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Recommender/universitydetails.dart';
import 'package:finalyearproject/models/UniversityModel.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  final List<UniversityModel> uniList;
  SearchResults({this.uniList});
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final uniName = [
    "NED University of Engineering and Technology",
    "UBIT - Karachi University ",
    "National University of Science and Technology",
    "Fast-NUCES",
    "Bahria University",
    "SZABIST",
    "Iqra University"
  ];
  List<UniversityModel> univModel = [];
  UniversityModel univvModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.uniList.isEmpty) {
      print("its null");
    } else
      print(widget.uniList.first.university);
  }

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
          padding: EdgeInsets.all(10),
          child: Container(
            color: secondaryColor,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Recommended universities based on your search",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: inputTextColor,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: SizedBox(
                    height: 30,
                    width: 100,
                    child: RaisedButton(
                      color: Colors.teal[100],
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: inputTextColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                            color: inputTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.all(10),
                    itemCount: widget.uniList.length,
                    itemBuilder: (context, index) {
                      UniversityModel uni = widget.uniList[index];

                      return InkWell(
                        focusColor: primaryColor,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UniversityDetails()));
                        },
                        child: SizedBox(
                          height: 100,
                          width: size.width / 1.5,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.blueGrey[50],
                            elevation: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  height: 90,
                                  width: 40,
                                  child: Image.asset(
                                    "assets/images/university.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width / 1.8,
                                        child: Text(
                                          uni.university,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: inputTextColor,
                                              height: 1.5),
                                        ),
                                      ),
                                      Text(
                                        uni.location,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: buttonColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
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
