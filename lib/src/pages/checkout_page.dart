import 'package:flutter/material.dart';
//import '../pages/signup_page.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/food_model.dart';
import '../data/order_data.dart';
//import '../pages/order_page.dart';
import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class Order{
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;
  final double quantity;

  Order({
    this.id,
    this.name,
    this.imagePath,
    this.category,
    this.price,
    this.discount,
    this.ratings,
    this.quantity
  });
}

class _CheckoutPageState extends State<CheckoutPage> {
    List<Food> _currentOrder = currentOrder;

  bool _toggleVisibility = true;
  TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email or username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      onChanged: (v) => nameController.text = v,
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              nameController.text,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgotten Password?",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Color(0xFFBDC2CB),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onLongPress: (){
                    
                    FirebaseDatabase.instance.reference().child("orders").push().set({"name": (nameController.text).toString(),
    'number': '00000000', "order": ordersummary, "longitude": "00000", "latitude": "000000", });
    //);
                    //_currentOrder);
//(nameController.text).toString()

                    //databaseReference.child("2").set({
    
//"title": (nameController.text).toString(),
    
//'description': 'is '});
                  },
                  onTap: () {
                    return showDialog(
                      
                      context: context,
                      
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: Text(nameController.text),
                        );

                      },

                    );

                  },
                  //tooltip: 'Show me the value!',
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                  //},
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
