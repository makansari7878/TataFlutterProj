import 'package:flu_appone/Dashboard.dart';
import 'package:flu_appone/FirstScreen.dart';
import 'package:flu_appone/ListScreen.dart';
import 'package:flu_appone/LoginScreen.dart';
import 'package:flu_appone/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math'; // Import the math library

void main() {
  runApp(
   MyApp()
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
    title: "My App",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 25, color: Colors.red),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.blue)
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        surface: Colors.yellowAccent,
        primary: Colors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 3),
        )
      ),

    ),
   routes: {
      "/": (context) => LoginScreen(),
     "/dashboard" : (context) => Dashboard(value: "HELLO WORLD"),
     "/listscreen" : (context) => ListScreen(),

   },

   //home: LoginScreen()
  );
  }

}

