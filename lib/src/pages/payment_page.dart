import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:food_app_flutter_zone/src/pages/order_page.dart';
import 'package:food_app_flutter_zone/src/pages/home_page.dart';
import 'package:food_app_flutter_zone/src/data/order_data.dart';
import 'package:food_app_flutter_zone/src/screens/main_screen.dart';
import 'package:food_app_flutter_zone/src/app.dart';

class PaymentPage extends StatefulWidget{
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>{
  HomePage homePage;
  PaymentPage paymentPage;
    List<Widget> pages;
  int currentTab = 0;
  Widget currentPage;

 @override
  void initState() {
    ordersummary ='';
    
    //final FirebaseDatabase database = FirebaseDatabase
    //    .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    //itemRef = database.reference().child('hours');
    homePage = HomePage();
    paymentPage = PaymentPage();
    //orderPage = OrderPage();
    //locationPage = LocationPage();
    //paymentPage =PaymentPage();
    //checkoutPage = CheckoutPage();
    //profilePage = ProfilePage();
    //cartPage = CartPage();
    pages = [paymentPage, homePage];

    currentPage = paymentPage;
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //new Container(),
        automaticallyImplyLeading: false,
        title: const Text('Payment'),
        backgroundColor: Color(0xff81DAF5),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          
         IconButton(
          icon: Icon(Icons.home),
          iconSize: 30,
          splashColor: Colors.blue,
          tooltip: 'Open shopping cart',
          onPressed: () {
            // Implement navigation to shopping cart page here...
            currentOrder.removeWhere((item) => item.id != "");
            ordervalue = 0;
            Navigator.of(context).popUntil((route) => route.isFirst);

            print('Shopping cart opened.');
          },
        ),
          //NavigationControls(_controller.future),
          //SampleMenu(_controller.future),
        ],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://www.paypal.me/kikiair/' +   (tipvalue+taxvalue+smallorder+servicefee+ordervalue).toStringAsFixed(2), //adding number adds the specific cart
          javascriptMode: JavascriptMode.unrestricted,
          
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        );
      }),

   /*   bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentOrder.removeWhere((item) => item.id != "");
            currentTab = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
            ),
            title: Text("Payment"),
          ),
         

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
         
          
          
          
        ],
      ),*/
      //floatingActionButton: favoriteButton(),
    );
  }

  }


