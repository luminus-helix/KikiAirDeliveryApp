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
      body: currentPage,
    );
  }
}
