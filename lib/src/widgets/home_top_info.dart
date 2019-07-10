import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

final databaseReference = FirebaseDatabase.instance.reference();

var openclose;

// maps api key AIzaSyBryu2oUXFOdwxD3G4pvNS2At
class HomeTopInfo extends StatefulWidget {
  @override
  _HomeTopState createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTopInfo> {
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
  /*_onEntryChanged(Event event) {
    
    setState(() {
      openclose = Item.fromSnapshot(event.snapshot);
    });
  }*/

  var hoursRef = FirebaseDatabase.instance.reference().child('hours');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: StreamBuilder(
                    stream: hoursRef.onValue,
                    //hoursRef.
                    builder: (context, snap) {
                      if (!snap.hasData) return Text("Loading...");
                      return Text("Kiki: We're " + snap.data.snapshot.value.toString() + "!",
                          style: textStyle);

                      //DataSnapshot snapshot = snap.data.snapshot;
//List item=[],
                      var jasonpilot;
//it gives all the documents in this list.
                      // jasonpilot=snapshot.value;

                      //Text(jasonpilot.toString(), style:textStyle);

//Now we're just checking if document is not null then add it to another list called "item".
//I faced this problem it works fine without null check until you remove a document and then your stream reads data including the removed one with a null value(if you have some better approach let me know).
                    }),
        //const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          //NavigationControls(_controller.future),
          //SampleMenu(_controller.future),
        ],
      ),
    );
    /* Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
              Text("Kiki", style: textStyle),
              //Text('bleh', style: textStyle,),

              Column(children: <Widget>[
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                Text("We're", style: textStyle),
                StreamBuilder(
                    stream: hoursRef.onValue,
                    builder: (context, snap) {
                      if (!snap.hasData) return Text("Loading...");
                      return Text(snap.data.snapshot.value.toString() + "!",
                          style: textStyle);

                      //DataSnapshot snapshot = snap.data.snapshot;
//List item=[],
                      var jasonpilot;
//it gives all the documents in this list.
                      // jasonpilot=snapshot.value;

                      //Text(jasonpilot.toString(), style:textStyle);

//Now we're just checking if document is not null then add it to another list called "item".
//I faced this problem it works fine without null check until you remove a document and then your stream reads data including the removed one with a null value(if you have some better approach let me know).
                    }),
              ])
            ],
          ),

          //Icon(Icons.notifications_none, size: 30.0, color: Theme.of(context).primaryColor,),
       // ],
      //),
    );*/
  }
}

class Item {
  String key;
  String title;
  String hours;

  Item(this.title, this.hours);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        //title = snapshot.value["title"],
        hours = snapshot.value["hours"];
}
