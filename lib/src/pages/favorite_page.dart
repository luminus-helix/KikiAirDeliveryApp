
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';

///import 'package:geoflutterfire/geoflutterfire.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:rxdart/rxdart.dart';
//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:rxdart/rxdart.dart';
//import 'dart:async';
class FavoritePage extends StatefulWidget{
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class FireMap extends StatefulWidget {
  @override
  State createState() => FireMapState();
}
var _markerId;

var currentLocation = LocationData;




class FireMapState extends State<FireMap> {
  GoogleMapController mapController;
  Location location = new Location();
  Marker marker;
  @override

 @override
  void initState() {
    super.initState();
    location.onLocationChanged().listen((location) async {
      if(marker != null) {
        mapController.removeMarker(marker);
      }
      marker = await mapController?.addMarker(MarkerOptions(
        position: LatLng(location["latitude"], location["longitude"]),
      ));
      mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              location["latitude"],
              location["longitude"],
            ),
            zoom: 20.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition:  CameraPosition(
                  target: LatLng(41.3115414,-72.928339), zoom: 15),
              
                myLocationEnabled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*


  build(context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(41.3115414,-72.928339), zoom: 15),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true, // Add little blue dot for device location, requires permission from user
          //mapType: MapType.hybrid, 
          //trackCameraPosition: true
          markers: _markerId,

        ),
      
        /*Positioned(
          bottom: 50,
          right: 10,
          child: 
          FlatButton(
            child: Icon(Icons.pin_drop),
            color: Colors.green,
            onPressed: () => _addMarker()
          )*/
      ]
    );
    
  }
  
  /*Marker _marker = new Marker(
  icon: BitmapDescriptor.defaultMarker,
  markerId: _markerId,
  position: LatLng(41.3115414,-72.928339),
  infoWindow: InfoWindow(title: "userMarker", snippet: '*'),
);*/


  /*void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });*/
  //}
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    }
    
    );

  }
  
  
}


class _FavoritePageState extends State<FavoritePage>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      body: FireMap()
      )
    );

  }
}

/*_addMarker() {
  var marker = MarkerOptions(
    position: mapController.cameraPosition.target,
    icon: BitmapDescriptor.defaultMarker,
    infoWindowText: InfoWindowText('Magic Marker', '🍄🍄🍄')
  );

  mapController.addMarker(marker);
}*/