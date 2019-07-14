
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_flutter_zone/src/pages/order_page.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:food_app_flutter_zone/src/widgets/bought_foods.dart';
import 'package:food_app_flutter_zone/src/data/order_data.dart';

double sendingLat = 000; 
double sendingLong = 000; 

class LocationPage extends StatefulWidget{
  @override
  _LocationPageState createState() => new _LocationPageState(); 


}



class _LocationPageState extends State<LocationPage>{
  @override
  
//final variable sent to email bot
  
  
  
  double finalLat = 0; 
  double finalLong = 0; 

  bool continueButtonShown = false;
  
  bool pinDropped = false; 

  LocationData _startLocation;
  LocationData _currentLocation;

  List<Circle> droneRange= []; 
  List<Marker> dropLocation = []; 
  

  StreamSubscription<LocationData> _locationSubscription;

  Location _locationService  = new Location();
  bool _permission = false;
  String error;

  bool currentWidget = false;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(41.3083, -72.9279),
    zoom: 12,
  );

  CameraPosition _currentCameraPosition;
  
  GoogleMap googleMap; 

  

  @override
  void initState() {
    super.initState();

    initPlatformState();
    droneRange.add(Circle(circleId: CircleId('1'),  center: LatLng(41.3083, -72.9279) , radius: 2500, fillColor: Colors.blue.withOpacity(0.2), strokeWidth: 0));
    for (var i =1; i<currentOrder.length;i++){
                ordersummary = ordersummary + " " + currentOrder[i].quantity.toString() + "x " + currentOrder[i].name;
              }
  }

  // asink shitq
  initPlatformState() async {
    await _locationService.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 1000);
    
    LocationData location;
    // gotta catch in case shit goes down
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("suck phat choades $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("fag $_permission");
        if (_permission) {
          location = await _locationService.getLocation();

          _locationSubscription = _locationService.onLocationChanged().listen((LocationData result) async {
            _currentCameraPosition = CameraPosition(
              target: LatLng(result.latitude, result.longitude),
              zoom: 16
            );

            final GoogleMapController controller = await _controller.future;
            //controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(finalLat, finalLong), zoom: 14,)));            
            


            if(mounted){
              setState(() {
                _currentLocation = result;
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if(serviceStatusResult){
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }

    setState(() {
        _startLocation = location;
    });

  }

  slowRefresh() async {
    _locationSubscription.cancel();
    await _locationService.changeSettings(accuracy: LocationAccuracy.BALANCED, interval: 10000);
    _locationSubscription = _locationService.onLocationChanged().listen((LocationData result) {
      if(mounted){
        setState(() {
          _currentLocation = result;
        });
      }
    });
  }

 markerCreate(LatLng latlng) {
  
  if (dropLocation.isEmpty) {
    setState(() {
      dropLocation.add(new Marker(markerId: MarkerId('1'), position: latlng,draggable: false ));
      finalLat = latlng.latitude; 
      finalLong = latlng.longitude; 
      continueButtonShown = true; 
    });
  } else {
   setState(() {
     dropLocation.clear(); 
   });
   setState(() {
     dropLocation.add(new Marker(markerId: MarkerId('1'), position: latlng,draggable: false ));
     finalLat = latlng.latitude; 
     finalLong = latlng.longitude; 
     continueButtonShown = true; 
   });
   

  }

 }

 currentLocationButtonPressed() {
    
    setState(() {

      markerCreate(LatLng(_currentLocation != null ? _currentLocation.latitude: 41.307, _currentLocation != null ? _currentLocation.longitude: -72.9));
      //dropLocation.clear(); 
      //dropLocation.add(new Marker(markerId: MarkerId('1'), position: LatLng(_currentLocation != null ? _currentLocation.latitude: 41.307, finalLong = _currentLocation != null ? _currentLocation.longitude: -72.9), draggable: false ));
      //continueButtonShown = true; 
    });
    
 }

 moveForwardButtonPressed() {
     setState(() {
       sendingLat = finalLat; 
       sendingLong = finalLong; 
     });
     Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage() ));
     
    }
     
     //_locationSubscription.cancel(); 

   //insert move to next screen code here//
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tap for Dropoff Location"),
          backgroundColor: Color(0xff81DAF5),
          elevation: 20,
          actions: <Widget>
           [
              
           ],
        ),
        body: Stack(
          
          children: [Container( 
                    
            alignment: Alignment(0, 0),    //GoogleMapSettings
            child:GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                },
                initialCameraPosition: _initialCamera, 
                myLocationButtonEnabled: true, 
                circles: Set.from(droneRange),
                markers: Set.from(dropLocation),
                onTap: (LatLng latlng){markerCreate(latlng); print("fuck off pendejo");} ,
                
                myLocationEnabled: true,
                scrollGesturesEnabled: true
                ),
            
              ),
              Align(alignment: Alignment.bottomLeft,child: 
              //green icon

              
              Container(
                 
                width: MediaQuery.of(context).size.width*0.7,
                height: 178,
                margin: EdgeInsets.fromLTRB(10,0,0,20),
                padding: EdgeInsets.all(5),
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.green[400]),
                child: new Column(
                
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
             

                children: [
                  
                   Container(
                     margin: EdgeInsets.all(2),
                     padding: EdgeInsets.all(2),
                     child:
                      FloatingActionButton.extended(onPressed: () {currentLocationButtonPressed();},
                      backgroundColor: Color(0xff81DAF5) ,
                      label: Text('Use Current Location', 
                      style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                        
                   ),
                         
                      
               /* Container(
                 
                width: 200,
                height: 40,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.green),
                child: RaisedButton(onPressed: () {currentLocationButtonPressed();},color: Colors.pink[700] ,child: Text('Use Current Location', style: TextStyle(color: Colors.white,fontSize: 16),),
                
                )
                ),*/
                

                continueButtonShown ? new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  mainAxisSize: MainAxisSize.min,
                  
                  
                  children: [

                    
                    /*RaisedButton(onPressed: () {},
                      elevation: 10,
                      color: Colors.green , 
                      child: Text('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15 ),)),
                    */
                  Container(
                  height: 50,
                   margin: EdgeInsets.all(2),
                   padding: EdgeInsets.all(2),
                   child: 

                   
                     RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

                      onPressed: () {moveForwardButtonPressed();},
                      elevation: 10, color: Colors.green ,
                      //icon: Icon(Icons.check_circle, color: Colors.white, size: 30),
                     child: 
                     new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Continue to Payment   ', style: TextStyle(color: Colors.white, fontSize:16, fontWeight: FontWeight.normal)),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                      
                      ]
                     )
                       
                     
                      )
                     
                    
                   )  
                  ]
                  ) : Container(), 
                
                  
                ]
                )

               )
              ),
              

              /*Align(alignment: Alignment.topRight,child:  //current location button
              Container(
                 
                width: 60,
                height: 60,
                margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.green),
                child: RaisedButton(onPressed: () {},color: Colors.blue ,child: Icon(Icons.pin_drop, color: Colors.white,),
                
                )
               )
              )*/ 

             
             ]

           
            )
      )
    );
  }




}

