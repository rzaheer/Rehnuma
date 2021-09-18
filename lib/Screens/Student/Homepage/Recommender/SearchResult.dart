import 'package:filter_list/filter_list.dart';
import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Loading.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Recommender/universitydetails.dart';
import 'package:finalyearproject/models/UniversityModel.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  final List<UniversityModel> uniList;
  SearchResults({this.uniList});
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<UniversityModel> currUnivModel = [];
  UniversityModel uniModel;
  List<String> countList = [
    "low to high",
    "High to low",
    "Location",
    "Four",
    "Five",
  ];
  List<String> selectedCountList = [];
  String highlowFee;

  String selectedValue;

  String selectedSubValue;

  String query;

  UniversityModel temp;
  void _handleRadioValueChange(String value) {
    setState(() {
      selectedValue = value;
    });
    print(selectedValue);
  }

  setselectedradio(value) {
    setState(() {
      selectedValue = value;
    });
  }

  highLowFee(value) {
    setState(() {
      highlowFee = value;
    });
  }

  Future _applyFilters() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
          backgroundColor: Colors.white,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Apply filters,'),
                RadioListTile(
                  selected: true,
                  activeColor: Colors.indigo,
                  dense: true,
                  value: 'Fee',
                  groupValue: selectedValue,
                  onChanged: (val) {
                    setselectedradio(val);
                  },
                  title: Text(
                    'Feee',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
                selectedValue == 'Fee'
                    ? Row(
                        children: <Widget>[
                          Radio(
                              activeColor: Colors.green,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 'Low to High',
                              groupValue: highlowFee,
                              onChanged: (value) {
                                if (selectedValue == 'Fee') {
                                  highLowFee(value);
                                }
                              }),
                          Text('Low to High'),
                          Radio(
                              activeColor: Colors.green,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 'High to Low',
                              groupValue: highlowFee,
                              onChanged: (value) {
                                if (selectedValue == 'Fee') {
                                  highLowFee(value);
                                }
                              }),
                          Text('High to Low'),
                        ],
                      )
                    : Container(),
                /*  Row(
                  children: [
                    Radio(
                        groupValue: selectedValue,
                        value: 'fees',
                        onChanged: _handleRadioValueChange),
                    Text(
                      'Fees',
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    children: [
                      Radio(
                          groupValue: selectedSubValue,
                          value: 'low to high',
                          onChanged: (v) {
                            setState(() {
                              selectedSubValue = v;
                            });
                          }),
                      Text(
                        'Low to high',
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Radio(
                          groupValue: selectedSubValue,
                          value: 'high to low',
                          onChanged: (v) {
                            setState(() {
                              selectedSubValue = v;
                            });
                          }),
                      Text(
                        'Low to high',
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Radio(
                        groupValue: selectedValue,
                        value: 'location',
                        onChanged: _handleRadioValueChange),
                    Text(
                      'Location',
                    ),
                  ],
                ), */
              ],
            ),
          )),
    );
  }

  createfilterQuery(String selectedValue) {
    int index = 0;
    if (selectedValue == 'Price') {
      if (highlowFee == 'Low to High') {
        for (int i = 0; i <= currUnivModel.length; i++)
          if (currUnivModel[index].undergraduateFees.bitLength <
              currUnivModel[index + 1].undergraduateFees.bitLength) {
            currUnivModel[index] = temp;
            temp = currUnivModel[index + 1];
            currUnivModel[index + 1] = currUnivModel[index];
          }
        print(currUnivModel[index]);
      } else if (highlowFee == 'High to Low') {}
    }
  }

  Future _openFilterDialog() async {
    await FilterListDialog.display<String>(context,
        listData: countList,
        selectedListData: selectedCountList,
        height: 480,
        headlineText: "Select Count",
        searchFieldHintText: "Search Here", label: (item) {
      return item;
    }, validateSelectedItem: (list, val) {
      return list.contains(val);
    }, onItemSearch: (list, text) {
      if (list.any(
          (element) => element.toLowerCase().contains(text.toLowerCase()))) {
        return list
            .where(
                (element) => element.toLowerCase().contains(text.toLowerCase()))
            .toList();
      } else {
        return [];
      }
    }, onApplyButtonClick: (list) {
      if (list != null) {
        setState(() {
          selectedCountList = List.from(list);
        });
      }
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    currUnivModel = widget.uniList;

    print(currUnivModel.length);
    print(currUnivModel.first);
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
                      onPressed: () async {
                        _applyFilters();
                      },
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
                widget.uniList == null
                    ? Loading()
                    : ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.all(10),
                        itemCount: widget.uniList.length,
                        itemBuilder: (context, index) {
                          UniversityModel uni = widget.uniList[index];

                          return InkWell(
                            focusColor: primaryColor,
                            onTap: () {
                              print(currUnivModel);
                              UniversityModel _uniModel = UniversityModel(
                                university: uni.university,
                                location: uni.location,
                                province: uni.province,
                                balochistan: uni.balochistan,
                                distance: uni.distance,
                                engDept: uni.engDept,
                                federal: uni.federal,
                                femaleNonPhD: uni.femaleNonPhD,
                                femalePhD: uni.femalePhD,
                                genDept: uni.genDept,
                                grandTotal: uni.grandTotal,
                                housing: uni.housing,
                                index: uni.index,
                                isEngineering: uni.isEngineering,
                                isGeneral: uni.isGeneral,
                                isMedical: uni.isMedical,
                                islamabad: uni.islamabad,
                                karachi: uni.karachi,
                                maleNonPhD: uni.maleNonPhD,
                                malePhD: uni.malePhD,
                                maleToFemaleRatio: uni.maleToFemaleRatio,
                                pec: uni.pec,
                                studentToFacultyRatio:
                                    uni.studentToFacultyRatio,
                                studentsEnrolled: uni.studentsEnrolled,
                                private: uni.private,
                                public: uni.public,
                                postgraduateFees: uni.postgraduateFees,
                                undergraduateFees: uni.undergraduateFees,
                                hec: uni.hec,
                                financialAid: uni.financialAid,
                                campuses: uni.campuses,
                                academicStaff: uni.academicStaff,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UniversityDetails(
                                            uniDetails: _uniModel,
                                          )));
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
