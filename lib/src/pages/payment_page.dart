import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class PaymentPage extends StatefulWidget{
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          //NavigationControls(_controller.future),
          //SampleMenu(_controller.future),
        ],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://www.paypal.me/kikiair/' + '35', //adding number adds the specific cart
          javascriptMode: JavascriptMode.unrestricted,
          
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        );
      }),
      //floatingActionButton: favoriteButton(),
    );
  }

  }


