import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finalyearproject/Global.dart';


/// Only for demo purposes!
/// Don't you dare do it in real apps!
class PaymentServices {
  Future<String> createCheckout() async {
    final auth = 'Basic ' + base64Encode(utf8.encode('$secretKey:'));
    final body = {
      'payment_method_types': ['card'],
      'line_items': [
        {
          "price_data": {
            "currency": "usd",
            "product_data": {
              "name": "Appointment",
            },
            "unit_amount": 2000,
          },
          "quantity": 1
        },
      ],
      'mode': 'payment',
   
      //'customer': 'cus_JXim3F3GpLT9wN',
      'success_url': 'https://www.google.com/',
      'cancel_url': 'https://www.facebook.com/',
    };

    try {
      final result = await Dio().post(
        "https://api.stripe.com/v1/checkout/sessions",
        data: body,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: auth},
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      return result.data['id'];
    } on DioError catch (e, s) {
      print(e.response);
      throw e;
    }
  }
}