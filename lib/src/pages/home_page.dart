import 'package:flutter/material.dart';
import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';
import 'package:food_app_flutter_zone/src/pages/cart_page.dart';

import '../widgets/home_top_info.dart';
import '../models/food_model.dart';
import 'package:firebase_database/firebase_database.dart';

// Data
import '../data/food_data.dart';

// Model 
import '../models/food_model.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<Food> _foods = foods;
  
  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);
  DatabaseReference itemRef;
  Item item;
  void initState() {
    super.initState();
    item = Item("", "");
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('hours');
    //itemRef.onChildAdded.listen(_onEntryAdded);
    //itemRef.onChildChanged.listen(_onEntryChanged);
  }
  var hoursRef = FirebaseDatabase.instance.reference().child('hours');


  @override
  Widget build(BuildContext context){
    //HomeTopInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiki', style: textStyle),
        backgroundColor: Color(0xff81DAF5),
                      //DataSnapshot snapshot = snap.data.snapshot;
//List item=[],
                     // var jasonpilot;
//it gives all the documents in this list.
                      // jasonpilot=snapshot.value;

                      //Text(jasonpilot.toString(), style:textStyle);

//Now we're just checking if document is not null then add it to another list called "item".
//I faced this problem it works fine without null check until you remove a document and then your stream reads data including the removed one with a null value(if you have some better approach let me know).
                   // }),
        //const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          Container(
           margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child:
            GestureDetector(
           onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CartPage()));

           },
           child: Icon(
              Icons.shopping_cart, size: 35
            ),
            )
          ),
          //NavigationControls(_controller.future),
          //SampleMenu(_controller.future),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        children: <Widget>[
         
      
          //foods.add(),
          //FoodCategory(),
          //SizedBox(height: 20.0,),
          //SearchField(),
          //SizedBox(height: 20.0,),
          

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Items",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /*GestureDetector(
                onTap: (){},
                child: Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),*/
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: _foods.map(_buildFoodItems).toList(), //converts the data from foods to a list
          ),
        ],
      ),
    );
  }

    Widget _buildFoodItems(Food food){
    return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFood(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          category: food.category,
          discount: food.discount,
          price: food.price,
          ratings: food.ratings,
          quantity: food.quantity, //makes sure to call them inside the widget so can be used later
        ),
        
      );
  }

}