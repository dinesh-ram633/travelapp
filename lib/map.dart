import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:travel_app/UI/bus_booking_home_screen.dart';
import 'package:travel_app/UI/bus_booking_main_page.dart';
import 'package:travel_app/login.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

@override
State<MyLocation> createState() => _MyLocationState();

}

class _MyLocationState extends State<MyLocation> {
  
  final Completer<GoogleMapController> _controller = Completer();
  late LatLng _deliveryLocation = LatLng(0, 0);
  late LatLng _currentLocation = LatLng(0, 0); 
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      Location location = Location();
      LocationData locationData = await location.getLocation();
      setState(() {
        _currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
      });
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _currentLocation,
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: _onMapTapped,
          markers: _deliveryLocation != null
              ? <Marker>{
                  Marker(
                    markerId: const MarkerId('delivery'),
                    position: _deliveryLocation,
                  )
                }
              : {},
        ),
        Padding(
      padding: const EdgeInsets.only(top: 70,left: 20,right: 20),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search your Location',
          suffixIcon: IconButton(
                    icon: const Icon(Icons.search,color: Colors.black,size: 30,),
                    onPressed: () async {
                      String query = _searchController.text;
                      if (query.isNotEmpty) {
                        List<geocoding.Location> locations =
                            await geocoding.locationFromAddress(query);
                        if (locations.length > 0) {
                          LatLng latLng = LatLng(locations[0].latitude,
                              locations[0].longitude);
                          _moveCamera(latLng);
                        }
                      }
                    },
                  ),
          contentPadding: EdgeInsets.only(left: 20, bottom: 5,right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black),
        ),
      )
    ),
    ),
        Positioned(
            bottom: 35,
            left: 15,
            child: IconButton(
            icon: const Icon(Icons.my_location,size: 45,),
            onPressed: () => _moveToCurrentLocation(),
            ),
    ),
          Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: 
                ElevatedButton(
                   onPressed: () => _saveDeliveryLocation(),
                   child: Text("Save",
                   style: TextStyle(
                    color: Colors.black,fontSize: 20
                   ),),
                   style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),)
    ),),)
        ))
      ]),
    );
  }

  void _moveToCurrentLocation() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: _currentLocation,
      zoom: 15,
    )));
  }

  void _onMapTapped(LatLng latLng) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _deliveryLocation = latLng;
      prefs.setDouble('deliveryLatitude', latLng.latitude);
      prefs.setDouble('deliveryLongitude', latLng.longitude);
    });
  }
  void _moveCamera(LatLng latLng) async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: latLng,
      zoom: 15,
    )));
  }
  void _saveDeliveryLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_deliveryLocation != null) {
      prefs.setDouble('deliveryLatitude', _deliveryLocation.latitude);
      prefs.setDouble('deliveryLongitude', _deliveryLocation.longitude);
      Navigator.push(context, 
      MaterialPageRoute(builder: (context) => BusBookingMainPage(),));
    }
  }
}
