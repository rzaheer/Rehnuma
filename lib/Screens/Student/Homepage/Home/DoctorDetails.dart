import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';

import 'package:finalyearproject/Screens/Student/Homepage/Home/BookAppointment/BookAppointment1.dart';
import 'package:finalyearproject/Screens/chatScreens/chat_page.dart';
import 'package:finalyearproject/models/mentorModel.dart';

import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  final MentorModel mentor;
  DoctorDetails({this.mentor});
  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final _formKey = GlobalKey<FormState>();
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
        title: Text('${widget.mentor.jobDesc}'),
      ),
      bottomNavigationBar: CustomNavbar(index: 0, indashboard: null),
      body: SingleChildScrollView(
        child: Container(
          color: secondaryColor,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Profile picture
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: widget.mentor.gender == 'Male'
                        ? Image.asset(
                            'assets/images/counselor.png',
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/femaledoc.png',
                            fit: BoxFit.fill,
                          ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.mentor.fullName}',
                          style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('${widget.mentor.jobDesc}',
                          style: TextStyle(
                            fontSize: 16,
                            color: inputTextColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('EDUCATION',
                  style: TextStyle(
                    fontSize: 17,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("${widget.mentor.educationlevel}",
                  style: TextStyle(
                    fontSize: 15,
                    color: inputTextColor,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20,
              ),
              Text('EXPERIENCE',
                  style: TextStyle(
                    fontSize: 17,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("${widget.mentor.experience.toString()}",
                  style: TextStyle(
                    fontSize: 15,
                    color: inputTextColor,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20,
              ),
              Text('CHARGES',
                  style: TextStyle(
                    fontSize: 17,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("1000 PKR per session",
                  style: TextStyle(
                    fontSize: 15,
                    color: buttonColor,
                    fontWeight: FontWeight.w900,
                  )),
              SizedBox(
                height: 20,
              ),
              Text('RATINGS',
                  style: TextStyle(
                    fontSize: 17,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, size: 16, color: Colors.green),
                  Icon(Icons.star, size: 16, color: Colors.green),
                  Icon(Icons.star, size: 16, color: Colors.green),
                  Icon(Icons.star, size: 16, color: Colors.green),
                  Icon(Icons.star_half, size: 16, color: Colors.green),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: CustomButton(
                  buttoncolor: Colors.green,
                  title: 'Book Appointment',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookAppointment1(mentor: widget.mentor)));
                  },
                  height: 50,
                  width: size.width / 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /* Center(
                child: CustomButton(
                  buttoncolor: buttonColor,
                  title: 'Message',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChatPage(mentor: widget.mentor)));
                  },
                  height: 50,
                  width: size.width / 2,
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
