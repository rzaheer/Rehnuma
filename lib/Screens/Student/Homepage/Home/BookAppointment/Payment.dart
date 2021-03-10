import 'package:finalyearproject/CustomWidgets/Custombottombar.dart';
import 'package:finalyearproject/CustomWidgets/Custombutton.dart';
import 'package:finalyearproject/CustomWidgets/Customdialog.dart';
import 'package:finalyearproject/Global.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Appointmentsettings/Appointments.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedIndex;
  final image = [
    "assets/images/easy.png",
    "assets/images/jazzz.png",
    "assets/images/bankcards.png",
  ];
  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
              titleString: 'Appointment booked!',
              contentString:
                  " Your appointment confirmation and details will be sent to you via Email",
              okFunction: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => StudentAppointments()),
                    (Route<dynamic> route) => false);
              });
        });
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
      bottomNavigationBar: CustomNavbar(index: 0, indashboard: null),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          color: secondaryColor,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Select Payment mode',
                  style: TextStyle(
                    fontSize: 22,
                    color: inputTextColor,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                separatorBuilder: (context, i) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 6.5,
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          setState(() {
                            selectedIndex = i;
                          });
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PaymentWebView()));

                        //                     Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        //     builder: (context) => TestWebview()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: selectedIndex == i ? primaryColor : Colors.white,
                        elevation: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              image[i],
                              height: 90,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: image.length),
            SizedBox(
              height: 40,
            ),
            Center(
              child: CustomButton(
                buttoncolor: buttonColor,
                title: 'DONE',
                onPressed: () {},
                height: 44,
                width: size.width / 3,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
