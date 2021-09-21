import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/BookAppointment/Payment.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:finalyearproject/models/slotModel.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class BookAppointment1 extends StatefulWidget {
  final MentorModel mentor;
  BookAppointment1({this.mentor});
  @override
  _BookAppointment1State createState() => _BookAppointment1State();
}

class _BookAppointment1State extends State<BookAppointment1> {
  int selectedIndex;
  final List<Map> timeSlots = [
    {"slot": "10:00 AM -10:45 AM", "slotID": 0},
    {"slot": "11:00 AM -11:45 AM", "slotID": 1},
    {"slot": "12:00 AM -12:45 AM", "slotID": 2},
  ];

  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  final format = DateFormat("dd/MM/yyyy");
  var index;
  List<MentorModel> mentorList = [];
  List<SlotModel> slotList = [], mentorSlots = [];
  final _formKey = GlobalKey<FormState>();

  /////
  int currYear = DateTime.now().year;
  int currMonth = DateTime.now().month;
  int currDay = DateTime.now().day;

  MentorModel currMentor;

  ////
  getAllMentors() async {
    await DBService().getMentorsList().then((value) {
      setState(() {
        mentorList = value;
      });
    });
    print("++++++++++++");
    print(mentorList.length);
    print(mentorList.first);
  }

  //Slot get call
  getAllSlots() async {
    await DBService().getSlotsList().then((value) {
      if (slotList.length != null) {
        if (slotList[index].mentorId == widget.mentor) {}
      }

      setState(() {
        slotList = value;
      });
    });
    print("++++++++++++");
    print(slotList.length);
    print(slotList.first);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currMentor = widget.mentor;
    });

    print(currYear + 1);
    print(currMonth);
    print(currDay);
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
          title: Text('Counselor name'),
        ),
        bottomNavigationBar: CustomNavbar(index: 0, indashboard: null),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Container(
            color: secondaryColor,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text('Select Date and Time Slot',
                        style: TextStyle(
                          fontSize: 22,
                          color: inputTextColor,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('Date',
                      style: TextStyle(
                        fontSize: 19,
                        color: buttonTextColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Container(
                      color: Colors.teal[50],
                      height: 44,
                      width: size.width / 1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: FaIcon(
                              FontAwesomeIcons.calendarAlt,
                              color: Colors.teal,
                              size: 26,
                            ),
                          ),
                          SizedBox(
                            height: 44,
                            width: size.width / 1.3,
                            child: DateTimeField(
                              controller: dateController,
                              onChanged: (value) {
                                setState(() {
                                  selectedDate = value;
                                });
                              },
                              style: TextStyle(
                                  fontSize: 15,
                                  color: inputTextColor,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                fillColor: Colors.teal[50],
                                filled: true,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusColor: primaryColor,
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: inputTextColor,
                                    fontWeight: FontWeight.bold),
                                hintText: '01/01/2021',
                              ),
                              validator: (val) {
                                return val == null
                                    ? 'Select date of birth'
                                    : null;
                              },
                              format: format,
                              onShowPicker: (context, currentValue) async {
                                return showDatePicker(
                                  context: context,
                                  firstDate:
                                      DateTime(currYear, currMonth, currDay),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(
                                    currYear,
                                    currDay < 31 ? currMonth : currMonth + 1,
                                    currDay + 6,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Time',
                      style: TextStyle(
                        fontSize: 19,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 6,
                        ),
                        //itemCount: slo,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Card(
                                color: selectedIndex == index
                                    ? Colors.teal[100]
                                    : secondaryColor,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "jjjj",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: inputTextColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CustomButton(
                      buttoncolor: buttonColor,
                      title: 'NEXT',
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          SlotModel currSlot = SlotModel(
                            day: dateController.text,
                            // timeSlot: timeController,
                            // mentorId: widget.mentor.mentorId
                            //  slotId:
                          );
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethod()));
                      },
                      height: 44,
                      width: size.width / 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
