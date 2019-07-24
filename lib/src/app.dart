import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Delivery App",
      theme: ThemeData(
        primaryColor: Color(0xff6BC0FC),
        fontFamily: 'Avenir',

      ),
      home: MainScreen(), //edit this to change the home Screen
    );
  }
}