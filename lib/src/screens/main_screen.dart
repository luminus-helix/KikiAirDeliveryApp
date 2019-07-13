import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/location_page.dart';
import '../pages/profile_page.dart';
import '../pages/payment_page.dart';
import '../pages/checkout_page.dart';
import '../pages/cart_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  bool bannerShown = true; 
  bool isOpen = true; 
  // Pages
  HomePage homePage;
  OrderPage orderPage;
  LocationPage locationPage;
  //LocationPage locationPage;
  CheckoutPage checkoutPage;
  //ProfilePage profilePage;
  PaymentPage paymentPage;
  CartPage cartPage;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    homePage = HomePage();
    orderPage = OrderPage();
    locationPage = LocationPage();
    paymentPage =PaymentPage();
    checkoutPage = CheckoutPage();
    //profilePage = ProfilePage();
    cartPage = CartPage();
    pages = [homePage, locationPage, cartPage, paymentPage, checkoutPage];

    currentPage = homePage;
    super.initState();
  }

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
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.6,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.lightBlueAccent.withOpacity(0.95), borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          alignment: Alignment(0,0.08),
          child: Container (
          width: MediaQuery.of(context).size.width*0.6,
          height: MediaQuery.of(context).size.height*0.4,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white  ),
         child: Image(
            image: AssetImage("assets/images/instructions.png"),
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.8,
          )
         )
        ),
        Container(
          alignment: Alignment(0,-0.62),
          width: MediaQuery.of(context).size.width*0.6,
          child: Text(
            isOpen ? 'Kiki is Open!' : "Kiki is Closed :(",
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )
        ), 
         Container(
          alignment: Alignment(0,-0.54),
          width: MediaQuery.of(context).size.width*0.8,
          child: Text(
            r"Free Delivery on Orders Less than $5!",
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
          )
        ), 
        Container(
          alignment: Alignment(0,-0.48),
          width: MediaQuery.of(context).size.width*0.6,
          child: Text(
            "Airdrop Instructions: ",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
          )
        ), 

        Container(
          alignment: Alignment(0,0.61),
          child: 
           FloatingActionButton(
             backgroundColor: Colors.red.withOpacity(0),
             foregroundColor: Colors.red.withOpacity(0),
             onPressed:(){
               setState(() {
                 bannerShown = false; 
               });
             } ,
             child: Icon(Icons.cancel, color: Colors.redAccent, size: 50),
             
             )

         )

       ],
        
     
      ) : Container(), 
     ], //children
     
     ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
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
              Icons.pin_drop,
            ),
            title: Text("Location"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            title: Text("Orders"),
          ),
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text("Profile"),
          ),
          
        ],
      ),
      
     );
    
  }
}
