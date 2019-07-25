import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'package:firebase_database/firebase_database.dart';
var newlong ;
var newlat;
class App extends StatelessWidget{
  
  void initState() {
  

  FirebaseDatabase.instance
  .reference()
  .child('longitude')
  .once()
  .then((DataSnapshot snapshot){
    newlong = snapshot.value.toString();
    print(newlong);
  });
  FirebaseDatabase.instance
  .reference()
  .child('latitude')
  .once()
  .then((DataSnapshot snapshot){
    newlong = snapshot.value.toString();
    print(newlat);
  });
 
    //ordersummary ='';
    
   
    //super.initState();
  }
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