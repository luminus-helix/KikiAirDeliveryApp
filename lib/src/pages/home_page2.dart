import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';
import 'package:food_app_flutter_zone/src/pages/cart_page.dart';
import 'package:food_app_flutter_zone/src/pages/order_page.dart';
import 'package:food_app_flutter_zone/src/data/order_data.dart';

import '../widgets/home_top_info.dart';
import '../models/food_model.dart';
import 'package:firebase_database/firebase_database.dart';

// Data
import '../data/food_data.dart';

// Model 
import '../models/food_model.dart';

class HomePage2 extends StatefulWidget{
  @override
  _HomePageState2 createState() => _HomePageState2();
}
var bluecolor = Color(0xff6BC0FC);
class _HomePageState2 extends State<HomePage2>{
  List<Food> _foods = foods2;
  List<Food> _foods2 = foods; //= foods;
  List <Food> _currentfood = foods;
  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('Candy', style: TextStyle(fontSize: 16)),
    1: Text('Snacks | Drinks'),
    2: Text('Essentials'),
   // 2: Text('Logo 3'),
  };

  final Map <int, List<Food>> foodstuff = <int, List<Food>>{
    0: foods2,
    1: foods,
    2: foods3,
  };
  /*final Map<int, Widget> icons = const <int, Widget>{
    0: _foods2,//.map(_buildFoodItems).toList(), //converts the data from foods to a list
         
    1: Center(
      child: FlutterLogo(
        colors: Colors.teal,
        size: 200.0,
      ),
    ),
    2: Center(
      child: FlutterLogo(
        colors: Colors.cyan,
        size: 200.0,
      ),
    ),
  };*/

  var sharedValue = 0;
  bool flag = false;

  

  void makelists(){
                         if (sharedValue == 0){
                           setState(() {
                             _currentfood = _foods2;


                           });
                         }     
                         else if (sharedValue == 1){
                           setState(() {
                             _currentfood = _foods;

                           });
//_currentfood = _foods;

                         }     
                         else{
setState(() {
                             _currentfood = _foods2;


                           });
                         }     
  }
  
  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);
  DatabaseReference itemRef;
  Item item;
  void initState() {
    //bool flag = true;

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
        title: //Text('Kiki', style: textStyle),
       Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'assets/images/logo.jpg',
                  fit: BoxFit.contain,
                  height: 990,
              ),
              //Container(
               //   padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))
            ],

          ),
        backgroundColor: Color(0xff6BC0FC),
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
         /* Container(
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
          ),*/
          //NavigationControls(_controller.future),
          //SampleMenu(_controller.future),
        ],
      ),

      body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            SizedBox(
              width: 500.0,
              //height:40,
              child: CupertinoSegmentedControl<int>(
                //color
                selectedColor: bluecolor,
                borderColor: bluecolor,
                children: logoWidgets,
                onValueChanged: (int val) {
                  setState(() {
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              ),
            ),
            Expanded(
              child: ListView(
        //shrinkWrap: true,
        padding: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
        children: <Widget>[
         
      
          //foods.add(),
          //FoodCategory(),
          //SizedBox(height: 20.0,),
          //SearchField(),
          //SizedBox(height: 20.0,),
          

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /*Text(
                "Items",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
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
         // SizedBox(height: 10.0),
          Column(
            children: 
            foodstuff[sharedValue].map(_buildFoodItems).toList(), //converts the data from foods to a list
          ),
        ],
      ),
            ),
          ],
        ),
      bottomNavigationBar: Container(
      height: 60.0,
      color: bluecolor,//Color(0xff6BC0FC),
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CartPage()));

           },
            child: Container(
           // mainAxisSize: MainAxisSize.max,
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            height:50.0,
            //padding: EdgeInsets.all(10.0),
            child:
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
         //  
         Column( children: <Widget>[
Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
            // Padding(
               
             // Expanded(
              //mainAxisAlignment: MainAxisAlignment.center,
             // child: Padding(
             // padding: const EdgeInsets.only(left: 32.0),

             // child: 
            /*  Container(
         // alignment: Alignment(0,0.1),
          width: MediaQuery.of(context).size.width*0.17,
         // height: MediaQuery.of(context).size.height*0.75,
          
         // decoration: BoxDecoration(color: Colors.lightBlueAccent.withOpacity(0.95), borderRadius: BorderRadius.circular(20)),
              ),*/
          Text(
                
                 r"$" + ordervalue.toStringAsFixed(2),
                //"23.0",
                style: TextStyle(
                    color: Color(0xff6BC0FC),
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal),
                    //textAlign: TextAlign.end,
              ),

             Text(
                "View Cart", //subtotal
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
                    //textAlign: TextAlign.center,
           //   ),
            //  ),
              ),
          
              
             
             
                  Text(
                
                 r"$" + ordervalue.toStringAsFixed(2),
                //"23.0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal),
                    //textAlign: TextAlign.end,
              ),
              
             
              
            ],
         // ),
            ),
            SizedBox(
              height:.0,
            )
         ],)
          
          ),
          ),
        ],
      ),
      ),
    );
  }

    Widget _buildFoodItems(Food food){
      
    //return Container(
        //margin: EdgeInsets.only(bottom: 1.0),
      //  child:
       return  Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(food.imagePath),
                      //AssetImage("assets/images/lunch.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(),// (35.0),
                 /* boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0))
                  ]*/),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 190), //130
                  child: 
                  Text(
                  food.name,
                  style: TextStyle(fontSize:20.0, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                ),
                
                SizedBox(height: 5.0),
                Text(
                  
                  //"\u01FE 3.0",
                  r'$' + food.price.toStringAsFixed(2), 
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      
                      //fontFamily: ff-
                      ),
                      
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
            Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(20)),
            child: 
            GestureDetector(
             // splashColor: Colors.grey,
              //borderRadius: BorderRadius.circular(1000),// circular(25),
              //backgroundColor: Color(0xff81DAF5),
              onTap: () {
                //
                      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OrderPage()));
                        //ordervalue = ordervalue +   widget.price; //should be the cost of the item
                        //ordersummary = ordersummary + widget.name;
                       
                        //if(!currentOrder.includes(widget.id)){
                        for (var i =0; i<currentOrder.length;i++){
                          if (currentOrder[i].id == food.id){
                            currentOrder[i].quantity+=1;

                            //currentOrder[i].price += 1.0;
                            //ordervalue = ordervalue +1.0;
                            flag = true;
                            break;
                          }
                          else {

                          
                      
                      continue;
                          }
                        }
                         if (flag == false){
                         currentOrder.add(Food(
                          id: food.id,
                          name: food.name,
                          imagePath: food.imagePath,
                          category: food.category,
                          price: food.price,
                          discount: food.discount,
                          ratings: food.ratings,
                          quantity: food.quantity,

                        )
                        
                        );
                        //ordersummary = ordersummary + widget.name+ ', ';
                        //addprice();
                        setState(() {
                          ordervalue += food.price;

                        });
                        //ordervalue +=widget.price;
                        }
                        else{
                          setState(() {

                            ordervalue = ordervalue + food.price;
                           // _currentOrder.contains(element)
                            //food.quantity+=1;
                          });
                          //ordervalue = ordervalue+widget.price;
                        }
                
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
              
              child: 
              Icon(
                
                //splashColor: Color(0xff81DAF5),
                //onPressed: (){}, 
                Icons.add,
                color: Colors.black, 
                size:35,)
              ),
            ),
            
          ],
        ),
      ),
        );
   // );
    }
         /*BoughtFood(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          category: food.category,
          discount: food.discount,
          price: food.price,
          ratings: food.ratings,
          quantity: food.quantity, *///makes sure to call them inside the widget so can be used later
       // ),
        
    //  );
  }
  

//}