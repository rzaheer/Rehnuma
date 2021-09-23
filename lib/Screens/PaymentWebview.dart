import 'dart:convert';

import 'package:finalyearproject/CustomWidgets/Customdialog.dart';
import 'package:finalyearproject/Screens/Student/Homepage/Appointmentsettings/Appointments.dart';
import 'package:finalyearproject/services/DBservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PaymentWebview extends StatefulWidget {
  String sessionId;
  String id;
  PaymentWebview({@required this.sessionId, @required this.id});
  @override
  _PaymentWebviewState createState() => _PaymentWebviewState();
}

class _PaymentWebviewState extends State<PaymentWebview> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  updateAppointment() async {
    await DBService().updatePaymentStatusToTrue(widget.id).then((value) {
      if (value) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                  buttonText: "OK",
                  titleString: 'Appointment booked!',
                  contentString:
                      " Your appointment confirmation and details will be sent to you via Email",
                  button1Function: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => StudentAppointments()),
                        (Route<dynamic> route) => false);
                  });
            });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print("this is url: $url");
      if (url == initialUrl) {
        _redirectToStripe();
      } else if (url == "https://www.google.com/") {
        print("Successfullll");
        flutterWebviewPlugin.close();
        updateAppointment();
      } else if (url == "https://www.facebook.com/") {
        flutterWebviewPlugin.close();
        print("Successfullll");
        flutterWebviewPlugin.close();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                  buttonText: "OK",
                  titleString: 'Error Occured',
                  contentString:
                      " An error occured during the payment process. Please try again",
                  button1Function: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
            });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebviewPlugin.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(
        url: initialUrl,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        initialChild: Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  void _redirectToStripe() {
    //<--- prepare the JS in a normal string
    final redirectToCheckoutJs = '''
var stripe = Stripe(\'pk_test_51JcvAkF9Ya0QnJFLUvLrxivohHWKTc1dyZ7Gk9jgDCBC1DTXY19mEQAoTz5bS82Lt4bmo9TBWVmQ4mpPqGJHb8HC00ciHnaqmi\');
    
stripe.redirectToCheckout({
  sessionId: '${widget.sessionId}'
}).then(function (result) {
  result.error.message = 'Error'
});
''';
    flutterWebviewPlugin.evalJavascript(
        redirectToCheckoutJs); //<--- call the JS function on controller
  }
}

String get initialUrl =>
    'data:text/html;base64,${base64Encode(Utf8Encoder().convert(kStripeHtmlPage))}';

const kStripeHtmlPage = '''
<!DOCTYPE html>
<html>
<script src="https://js.stripe.com/v3/"></script>
<head><title>Stripe checkout</title>
<style>
h3 {text-align: center;}
</style>
</head>
<body>
<h3>Loading..</h3>
<h3>Please wait</h3>
</body>
</html>
''';
