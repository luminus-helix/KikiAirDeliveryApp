import 'package:flutter/material.dart';
import 'package:food_app_flutter_zone/src/data/order_data.dart';
import 'package:food_app_flutter_zone/src/pages/order_page.dart';
import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';
import 'package:food_app_flutter_zone/src/pages/cart_page.dart';
import 'package:food_app_flutter_zone/src/models/food_model.dart';

//List<Food> currentOrder2 = currentOrder;


class OrderCard extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;
  final int quantity;

  OrderCard(
      {this.id,
      this.name,
      this.imagePath,
      this.category,
      this.price,
      this.discount,
      this.ratings,
      this.quantity});

  @override
  _OrderCardState createState() => _OrderCardState();
}
//double ordervalue = 0.0;

//int quantity =  0;
bool flag2 = false;

class _OrderCardState extends State<OrderCard> {
  dynamic counter = '';
  var removeid;
  void addprice(){
    setState((){
      //widget.price++;
      //ordervalue = ordervalue + widget.price;

      //counter = quantity.toString();
    });
  } 
  void addprice2(){
    setState(() {
    ordervalue = ordervalue + widget.price;

    });
  }

  @override//int
  Widget build(BuildContext context) {
  //int quantity =   0;

  if(widget.id == ''){
  return new Card(
    child: Text('Cart is Empty'),
  );
  }
  else{
  
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
              height: 73.0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      //InkWell(
                        onTap: () {
                          addprice();
                          addprice2();
                        },
                        child: Icon(Icons.keyboard_arrow_up,
                            color: Color(0xFFD3D3D3))),


                    

                    Text(
                      //counter,
                      widget.quantity.toString(),
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    InkWell(
                        onTap: () {},
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
                      image: AssetImage(widget.imagePath),
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
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  
                  //"\u01FE 3.0",
                  r'$' + widget.price.toStringAsFixed(2),
                  //ordervalue.toString(), 
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Container(
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
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                
                flag2 = true;
                setState(() {
                  currentOrder;
                  currentOrder.removeWhere((item) => item.id == widget.id);

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
  }
}
