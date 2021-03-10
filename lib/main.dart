import 'package:finalyearproject/Screens/Splashscreen/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      //localizationsDelegates: [
      //GlobalMaterialLocalizations.delegate,
      //GlobalWidgetsLocalizations.delegate,
      //DefaultCupertinoLocalizations.delegate,
      //GlobalCupertinoLocalizations
      //  .delegate,],
      locale: Locale('en', 'US'), // Current locale
      supportedLocales: [
        const Locale('en', 'US'), // English
        // Thai
      ],
      title: 'Rehnuma',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xFF03A9AF),
        cursorColor: Color(0xFF03A9AF),
        appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(
          color: Colors.black,
        )),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
