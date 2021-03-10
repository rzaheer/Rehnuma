import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/Global.dart';

import 'package:finalyearproject/Screens/Student/Homepage/Home/BookAppointment/BookAppointment1.dart';

import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
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
        child: Container(
          color: secondaryColor,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Profile picture
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
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Counselor Name',
                          style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('A short job description',
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
              Text("Short detail of Counselors' education",
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
              Text("Years of education to be mentioned here.",
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
              Text("1000 PKR/session \nsession duration is 30 minutes",
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
                  buttoncolor: buttonColor,
                  title: 'Book Appointment',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookAppointment1()));
                  },
                  height: 50,
                  width: size.width / 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
