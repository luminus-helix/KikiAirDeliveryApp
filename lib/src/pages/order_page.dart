import 'package:flutter/material.dart';
import 'package:food_app_flutter_zone/src/pages/sigin_page.dart';
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
  double ordervalue = 0.0;
int quantity = 0;
class OrderTotal extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;

  OrderTotal(
      {this.id,
      this.name,
      this.imagePath,
      this.category,
      this.price,
      this.discount,
      this.ratings});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  List<Food> _currentOrder = currentOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Food Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      /*body: ListView.builder(
        itemCount: _currentOrder.length,
        itemBuilder: (context, int index){
          return new Dismissible(
            key: new Key((_currentOrder[index]).toString()),
            onDismissed: (direction){
              _currentOrder.removeAt(index);
            },
            child: <Widget>[
             _currentOrder.map(_buildorderitems).toList()]
          ); 
        }
      ,)*/
      body: ListView(
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
      ),
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
      height: 220.0,
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
                "Subtotal", //subtotal
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ordervalue.toString(),
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
                "Order Summary", //add discount
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '',
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
                "0.5",
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
                (ordervalue*.5).toString(),
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
              databaseReference.child("1").set({
    
'title': 'Mastering EJB',
    
'description': 'Programming Guide for J2EE'});
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Proceed To Checkout",
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
            height: 20.0,
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
