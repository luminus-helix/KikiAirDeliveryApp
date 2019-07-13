import 'package:flutter/material.dart';
import '../pages/home_page.dart';
//import '../pages/order_page.dart';
//import '../pages/location_page.dart';
//import '../pages/profile_page.dart';
//import '../pages/payment_page.dart';
//import '../pages/checkout_page.dart';
import '../pages/cart_page.dart';
import 'package:firebase_database/firebase_database.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}
bool isOpen = false; 

class _MainScreenState extends State<MainScreen> {
  DatabaseReference itemRef;

  int currentTab = 0;
  bool bannerShown = true; 
  // Pages
  HomePage homePage;
  //OrderPage orderPage;
  //LocationPage locationPage;
  //LocationPage locationPage;
  //CheckoutPage checkoutPage;
  //ProfilePage profilePage;
  //PaymentPage paymentPage;
  CartPage cartPage;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('hours');
    homePage = HomePage();
    //orderPage = OrderPage();
    //locationPage = LocationPage();
    //paymentPage =PaymentPage();
    //checkoutPage = CheckoutPage();
    //profilePage = ProfilePage();
    cartPage = CartPage();
    pages = [homePage,  cartPage];

    currentPage = homePage;
    super.initState();
  }
  var hoursRef = FirebaseDatabase.instance.reference().child('hours');

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: 
     Stack(
     alignment: Alignment.center,
     children: [
    currentPage, 
     bannerShown ?
     Stack(
       alignment: Alignment.center,
       children: <Widget>[
        currentPage,
        Container(
          alignment: Alignment(0,0.1),
          width: MediaQuery.of(context).size.width*0.94,
          height: MediaQuery.of(context).size.height*0.75,
          
          decoration: BoxDecoration(color: Colors.lightBlueAccent.withOpacity(0.95), borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          alignment: Alignment(0,0.13),
          child: Container (
          width: MediaQuery.of(context).size.width*0.61,
          height: MediaQuery.of(context).size.height*0.45,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white  ),
         child: Image(
            image: AssetImage("assets/images/instructions.png"),
            width: 0.9*MediaQuery.of(context).size.width,
            height: 0.9*MediaQuery.of(context).size.height,
          )
         )
        ),
        Container(
          alignment: Alignment(0,-0.75),
          width: MediaQuery.of(context).size.width*0.6,
          child: 
          StreamBuilder(
                    stream: hoursRef.onValue,
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        
                        return Text("Loading...");

                      } //Text("Loading...");
                      else if(snap.data.snapshot.value.toString() == 'Open') {
                        isOpen = true;
                          return Text("We're Open!",
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold));
                      //return Text("Kiki: We're " + snap.data.snapshot.value.toString() + "!",
                         // style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold));
                      }
                      else{
                        isOpen = false;
                          return Text("Sorry, we're closed",
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold));
                      }

                    }),
          
        ), 
         Container(
          alignment: Alignment(0,-0.63),
          width: MediaQuery.of(context).size.width*0.8,
          child: Text(
            r"Free Delivery on Orders Less than $5!",
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
          )
        ), 
        Container(
          alignment: Alignment(0,-0.545),
          width: MediaQuery.of(context).size.width*0.6,
          child: Text(
            "Airdrop Instructions: ",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
          )
        ), 

        Container(
          alignment: Alignment(0,0.755),
          child: 
           FloatingActionButton(
             //materialTapTargetSize: ,
             //backgroundColor: Colors.red.withOpacity(0),
             //foregroundColor: Colors.red.withOpacity(0),
             onPressed:(){
               setState(() {
                 bannerShown = false; 
               });
             } ,
             child: Icon(Icons.cancel, color: Colors.white, size: 40),
             
             )

         )

       ],
        
     
      ) : Container(), 
     ], //children
     
     ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
     /* bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
         
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            title: Text("Cart"),
          ),
          
         
          
        ],
      ),
      */
     );
    
  }
}
