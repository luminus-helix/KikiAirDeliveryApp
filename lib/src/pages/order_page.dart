import 'package:flutter/material.dart';
import 'package:food_app_flutter_zone/src/pages/payment_page.dart';
import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';
import '../widgets/order_card.dart';
import 'package:food_app_flutter_zone/src/data/food_data.dart';
import 'package:food_app_flutter_zone/src/models/food_model.dart';
//import 'package: package_info/package_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app_flutter_zone/src/data/order_data.dart';
import '../models/food_model.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
final databaseReference = FirebaseDatabase.instance.reference();
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}
double ordervalue = 0.00;
//int quantity = 0;
double taxvalue = ordervalue*.08;
double tipvalue = 0.00;
double smallorder = 1.0;
double servicefee = .3 + .03*ordervalue;
double totalwithtip = ordervalue+taxvalue+smallorder+servicefee;
double totalorder = ordervalue+taxvalue+smallorder+servicefee;
void smallorderfee(){
    if (ordervalue<100.0){
      smallorder= 1.00;
    }
    else 
    {
      smallorder = 0.00;
    }
}
class OrderTotal extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;
  final int quantity;

  OrderTotal(
      {this.id,
      this.name,
      this.imagePath,
      this.category,
      this.price,
      this.discount,
      this.ratings,
      this.quantity});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
 bool _toggleVisibility = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController tipController = TextEditingController();
  String validateName(String value) {
      if (value.isEmpty) {
        return "Please fill out";
      }
      return null;
    }
  void prefixtext(){
    if (int.parse(tipController.text) <= .50){
      tipController.text = '.50';
    }
    else{

    }
  }

  Widget _buildNameTextField() {
    return TextField(
      controller: nameController,

      decoration: InputDecoration(
        hintText: "Full Name",
        errorText: validateName(nameController.text),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onChanged: (v) => nameController.text = v,

    );
  }
  Widget _buildEmailTextField() {
    return TextField(
            controller: emailController,
      onChanged: (z) => emailController.text = z,

      decoration: InputDecoration(
        errorText: validateName(emailController.text),

        hintText: "Email",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }
  Widget _buildPhoneNumberTextField() {
    return TextField(
      controller: phoneNumberController,
      onChanged: (j) => phoneNumberController.text = j,
      decoration: InputDecoration(
        errorText: validateName(phoneNumberController.text),
        //prefixText: ".50",
        hintText: "Phone Number",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }
Widget _buildTipTextField() {
    return TextField(
      //prefixtext(),
      controller: tipController,
      onChanged: (j) => tipController.text = j,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
      //errorText: validateName(phoneNumberController.text),
        //text
        hintText: "Min 0.50",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,

        ),
      ),
    );
  }
  
  List<Food> _currentOrder = currentOrder;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
      ),
      
     
      body:
       Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /*Text(
              "Sign In",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),*/
            SizedBox(
              height: 30.0,
            ),
            /*Row(
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
            ),*/
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildNameTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildEmailTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildPhoneNumberTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            /*Container(
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
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
      /*ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,

        children: <Widget>[
        //onDismissed()
        Column(
        children: //<Widget>[
          //OrderCard(),
          //OrderCard(),
          _currentOrder.map(_buildorderitems).toList(), 
          
          //_buildOrderSummary(),
        //],
      ),
      Container(
      height: 200.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      width: 200,
          //height: 100,
          // red box
          child: Text( '',
            //ordersummary,
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
    )
      //scrollDirection: Axis.vertical,

        ]
      ),*/
      bottomNavigationBar: _buildTotalContainer(),

    );
  }
  /*Widget _buildOrderSummary(){
    return Container(
      height: 200.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      width: 200,
          //height: 100,
          // red box
          child: Text(
            ordersummary,
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
    );
  }*/
  Widget _buildTotalContainer() {
    return 
    Container(
      height: 400.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tip your pilot now?",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              
              
              
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children: <Widget>[
              /*Text(
                "Tip",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
          //    ),*/
//Container(
           //     width:200.0,
                
         //  child:
             //   ListView(
             //   scrollDirection: Axis.vertical,
        
        
      
              //  children: <Widget> [ 
                ButtonTheme(
                  layoutBehavior: ButtonBarLayoutBehavior.constrained,
                  minWidth: 75.0,
                  buttonColor: Colors.white,
                  //padding: new EdgeInsets.all(30.0),
                  child: ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  
                  children: <Widget>[

            RaisedButton(
                child: new Text('0.50'),
                onPressed: (){
                  setState(() {
                  tipvalue = .5;
                  //totalorder = totalorder +tipvalue;
                  totalorder = totalorder +.5;
                });
                },
            ),
            RaisedButton(
                child: new Text('0.75'),
                onPressed: (){
                  setState(() {
                  tipvalue = .75;
                  //totalorder = totalpretip;
                  totalorder = totalorder +0.75;
                });
                },
            ),
             RaisedButton(
                child: new Text('1.00'),
                onPressed: (){
                  setState(() {
                  tipvalue = 1.00;
                  //totalorder = totalpretip;
                  totalorder = totalorder +1.0;
                  //totalorder = totalorder +tipvalue;
                });
                },
            ),
            RaisedButton(
                child: new Text('Not Now'),
                onPressed: (){
                  setState(() {
                  tipvalue = 0;
                  totalorder = totalwithtip;
                  //totalorder = totalorder +.5;
                });
                },
            ),
          ],
                  ),
                ),
            //_buildTipTextField()),
             // )
              //  ],
              //),
              //),
            ]
          ),
         // ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Subtotal", //subtotal
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ordervalue.toStringAsFixed(2),
                //"23.0",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          
        
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tax",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              
              Text(
                taxvalue.toString(),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Small Order Fee", //add discount
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              //_buildPasswordTextField() ,
              Text(
                smallorder.toStringAsFixed(2),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
                    Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Service Fee",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                servicefee.toStringAsFixed(2),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Cart Total",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                totalorder.toStringAsFixed(2),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              //caffoldkey
              
              //)
              if(nameController.text.isNotEmpty &&emailController.text.isNotEmpty &&phoneNumberController.text.isNotEmpty&&double.parse(tipController.text)>0.5){
              FirebaseDatabase.instance.reference().child("orders").push().set({"name": (nameController.text).toString(),
    'email': emailController.text.toString(), 'number': phoneNumberController.text.toString(),"order": ordersummary, "longitude": "00000", "latitude": "000000", });
              //databaseReference.child("1").set({ 'title': 'Mastering EJB','description': 'Programming Guide for J2EE'});
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PaymentPage()));
            }
            else{

            }},
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Proceed To Payment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
  Widget _buildorderitems(Food food){
    return Container(

   // if (_currentOrder = null){} return
        margin: EdgeInsets.only(bottom: 20.0),
        child: OrderCard(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          category: food.category,
          discount: food.discount,
          price: food.price,
          ratings: food.ratings, //makes sure to call them inside the widget so can be used later
        ),
        
      );
  }

}
