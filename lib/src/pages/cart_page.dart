import 'package:flutter/material.dart';
import 'package:food_app_flutter_zone/src/pages/order_page.dart';
import 'package:food_app_flutter_zone/src/screens/main_screen.dart';
import '../widgets/order_card.dart';
import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';
import 'package:food_app_flutter_zone/src/models/food_model.dart';
import 'package:food_app_flutter_zone/src/pages/location_page.dart';

//import 'package: package_info/package_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app_flutter_zone/src/data/order_data.dart';
import '../models/food_model.dart';
final postPageKey = GlobalKey<_CartPageState>();

//import 'package:cloud_firestore/cloud_firestore.dart';
final databaseReference = FirebaseDatabase.instance.reference();
var emptystring;
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

  //double ordervalue = 0.0;
//int quantity = 0;

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
  _CartPageState createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> {
List<Food> _currentOrder = currentOrder;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: postPageKey,
      appBar: AppBar(
        title: Text(
          "Your Food Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Color(0xff81DAF5),
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
      body: ListView( //this store the order cards
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,

        children: <Widget>[
        //onDismissed()
        
        Column(
        children: //<Widget>[
          //OrderCard(),
          //OrderCard()
          //_currentOrder.
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
      height: 100.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 30.0
      ),
      child:
      Column( 
        mainAxisAlignment: MainAxisAlignment.end, 
        children: <Widget>[
          GestureDetector(
            
            onTap: () {
              if (isOpen == false){
              
                
                 return showDialog(
                      
                      context: context,
                      
                      builder: (context) {
                        
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: Text("Sorry we're closed right now"),
                        );
                        

              }
                 );
              }
              
              else{
               
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LocationPage()));
               
              }

            
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
          
         // );
        //],
      //),
        ],
      ),
    );
  }
  Widget _buildorderitems(Food food){
    //return Container(

   // if (_currentOrder = null){} return
       // margin: EdgeInsets.only(bottom: 20.0),
       // child: 
        /*OrderCard(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          category: food.category,
          discount: food.discount,
          price: food.price,
          ratings: food.ratings, //makes sure to call them inside the widget so can be used later
        ),*/
        if(food.id == ''){
          setState(() {
                      emptystring = 'Please add items to the cart!';

          });
         // 'Please add items to the cart!'
  return new Container(
    
   // child: Text(emptystring),
  );
  }
  else{
    setState(() {
          emptystring = '';

    });
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 45.0,
              height: 78.0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      //InkWell(
                        onTap: () {
                          //addprice();
                          setState(() {
                            food.quantity+=1;
                            ordervalue = ordervalue + food.price;
                           // _currentOrder.contains(element)
                            //food.quantity+=1;
                          });
                          //addprice2();
                        },
                        child: Icon(Icons.keyboard_arrow_up,
                            color: Color(0xFFD3D3D3))),


                    

                    Text(
                      //counter,
                      //currentOrder.
                      food.quantity.toString(),
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            if(food.quantity >1){
                            food.quantity-=1;
                            ordervalue = ordervalue - food.price;}
                            else{
                              food.quantity = 1;
                            }
                           // _currentOrder.contains(element)
                            //food.quantity+=1;
                          });
                          //addprice2();
                        },
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xFFD3D3D3))),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(food.imagePath),
                      //AssetImage("assets/images/lunch.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0))
                  ]),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 130),
                  child: 
                  Text(
                  food.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                ),
                
                SizedBox(height: 5.0),
                Text(
                  
                  //"\u01FE 3.0",
                  r'$' + food.price.toStringAsFixed(2), 
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
               /* Container(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("blank", //used to be the under text of it that said chicken
                              style: TextStyle(
                                  color: Color(0xFFD3D3D3),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "blank",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                
                flag2 = true;
                setState(() {
                  //_currentOrder;
                  _currentOrder.removeWhere((item) => item.id == food.id);
                  ordervalue = ordervalue - food.quantity*food.price;
                  //refreshList();
                });
                //_pageController;

                        //if(!currentOrder.includes(widget.id)){
                     /*   for (var i =0; i<currentOrder.length;i++){
                          if (currentOrder[i].id == widget.id){
                            currentOrder[i].price += 1.0;
                            //ordervalue = ordervalue +1.0;
                            flag2 = true;
                            removeid = i;
                            break;
                          }
                          else {

                          
                      
                      continue;
                          }
                      //else{}
                        }
                       if (flag2 == true){
                        currentOrder.
                        ordersummary = ordersummary + widget.name+ ', ';
                        //addprice();
                        ordervalue +=widget.price;
                        }
                        else{
                          //ordervalue = ordervalue+widget.price;
                        }*/
              },
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );}
        
     // );
  }

}
