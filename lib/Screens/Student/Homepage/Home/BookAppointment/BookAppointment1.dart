import 'dart:math';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customtoast.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Home/BookAppointment/Payment.dart';
import 'package:finalyearproject/models/AppointmentModel.dart';
import 'package:finalyearproject/models/mentorModel.dart';
import 'package:finalyearproject/models/slotModel.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:finalyearproject/services/StudentProvider.dart';
import 'package:finalyearproject/services/sharedFunctions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookAppointment1 extends StatefulWidget {
  final MentorModel mentor;
  BookAppointment1({this.mentor});
  @override
  _BookAppointment1State createState() => _BookAppointment1State();
}

class _BookAppointment1State extends State<BookAppointment1> {
  SlotModel selectedSlot;
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
  List<SlotModel> filteredSlots = [];
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
  }

  //Slot get call
  getAllSlots() async {
    await DBService().getSlotsListBySlotIds(widget.mentor.slots).then((value) {
      print(value.length);

      setState(() {
        slotList = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currMentor = widget.mentor;
    });
    getAllSlots();
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
                                  selectedSlot = null;
                                });
                                List<SlotModel> temp = [];
                                slotList.forEach((element) {
                                  if (element.startTime.weekday ==
                                      selectedDate.weekday) {
                                    temp.add(element);
                                  }
                                });
                                setState(() {
                                  filteredSlots.clear();
                                  filteredSlots.addAll(temp);
                                });
                                print(filteredSlots.length);
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
                    child: filteredSlots.length == 0
                        ? Center(
                            child: Text(
                              "No slots available.\nPlease select another date from the calender",
                              textAlign: TextAlign.center,
                            ),
                          )
                        : GridView.builder(
                            itemCount: filteredSlots.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 6,
                            ),
                            //itemCount: slo,
                            itemBuilder: (BuildContext context, int i) {
                              return SizedBox(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedSlot = slotList[i];
                                    });
                                  },
                                  child: Card(
                                    color: selectedSlot == slotList[i]
                                        ? Colors.teal[100]
                                        : secondaryColor,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          formatTime24Hr(
                                                  slotList[i].startTime) +
                                              "-" +
                                              formatTime24Hr(
                                                  slotList[i].endTime),
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
                      onPressed: () async {
                        if (selectedDate != null) {
                          Random random = new Random();
                          int randomNumber = random.nextInt(10000);
                          StudentProvider prov = Provider.of<StudentProvider>(
                              context,
                              listen: false);
                          AppointmentModel appointment = AppointmentModel(
                              appointmentId: randomNumber.toString(),
                              mentorId: widget.mentor.mentorId,
                              startTime: selectedSlot.startTime,
                              endTime: selectedSlot.endTime,
                              slotId: selectedSlot.slotId,
                              isCompleted: false,
                              mentorName: widget.mentor.fullName,
                              paymentReceived: false,
                              studentId: prov.currStudent.studentId);
                          await DBService()
                              .postAppointment(appointment)
                              .then((success) {
                            if (success) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentMethod(
                                        appointmentModel: appointment,
                                      )));
                            } else {
                              CustomToast().showerrorToast("An error occured");
                            }
                          });
                        }
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
