import 'package:flutter/material.dart';
import 'package:food_app_flutter_zone/src/widgets/order_card.dart';
import 'package:food_app_flutter_zone/src/data/order_data.dart';
import '../models/food_model.dart';
import '../pages/order_page.dart';
class BoughtFood extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;

  BoughtFood(
      {this.id,
      this.name,
      this.imagePath,
      this.category,
      this.price,
      this.discount,
      this.ratings});

  @override
  _BoughtFoodState createState() => _BoughtFoodState();
}

String ordersummary = "";

class _BoughtFoodState extends State<BoughtFood> {
  var cardText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 230.0,
            width: 340.0,
            child: Image(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            width: 340.0,
            height: 70.0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.black12])),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      children: <Widget>[
                        /*Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),*/
                        Text(
                          //"$" + widget.ratings.toString() + " Reviews)", //concatenate
                          widget.price
                              .toString(), //concatenate a dollar sign here

                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        //
                        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OrderPage()));
                        //ordervalue = ordervalue +   widget.price; //should be the cost of the item
                        //ordersummary = ordersummary + widget.name;
                        var newitem = Food(
                          id: widget.id,
                          name: widget.name,
                          imagePath: widget.imagePath,
                          category: widget.category,
                          price: widget.price,
                          discount: widget.discount,
                          ratings: widget.ratings,
                        );
                        //if(!currentOrder.includes(widget.id)){
                        for (var i =0; i<currentOrder.length;i++){
                          if (currentOrder[i].id == widget.id){
                            currentOrder[i].price += 1.0;
                            //ordervalue = ordervalue +1.0;
                            flag = true;
                            break;
                          }
                          else {

                          
                      
                      continue;
                          }
                      //else{}
                        }
                       if (flag == false){
                         currentOrder.add(Food(
                          id: widget.id,
                          name: widget.name,
                          imagePath: widget.imagePath,
                          category: widget.category,
                          price: widget.price,
                          discount: widget.discount,
                          ratings: widget.ratings,

                        )
                        
                        );
                        ordersummary = ordersummary + widget.name+ ', ';
                        //addprice();
                        ordervalue +=widget.price;
                        }
                        else{
                          //ordervalue = ordervalue+widget.price;
                        }
                    },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        //color: Theme.of(context).primaryColor,
                        size: 30.0,
                      ),
                      /*Text(
                        widget.price.toString(),
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                      ),
                      Text("Min order",
                          style: TextStyle(color: Colors.grey))*/
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
