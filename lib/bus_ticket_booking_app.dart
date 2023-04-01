import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/UI/bus_booking_detail_page.dart';
import 'package:travel_app/UI/bus_booking_home_screen.dart';
import 'package:travel_app/UI/bus_booking_main_page.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/map.dart';
import 'package:travel_app/newseat.dart';
import 'package:travel_app/splash.dart';

class BusTicketBookingApp extends StatelessWidget {
  BusTicketBookingApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      // routerConfig: appRoute,
     debugShowCheckedModeBanner: false,
       initialRoute: '/splash',
  routes: {
    '/login': (context) => LoginPage(),
    '/home':  (context) => BusBookingMainPage(),
    '/newseat' :(context) => BookingPage(bus: myBus),
    '/map' :(context) => MyLocation(),
    '/splash' :(context) => SplashScreen(),
  },
    );
  }
}
