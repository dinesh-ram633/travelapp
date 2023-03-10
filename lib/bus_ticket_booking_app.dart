import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/UI/bus_booking_detail_page.dart';
import 'package:travel_app/UI/bus_booking_home_screen.dart';
import 'package:travel_app/UI/bus_booking_main_page.dart';
import 'package:travel_app/UI/bus_seat_page.dart';
import 'package:travel_app/UI/seat.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/map.dart';
import 'package:travel_app/newseat.dart';

class BusTicketBookingApp extends StatelessWidget {
  BusTicketBookingApp({super.key});
  // final appRoute = GoRouter(
  //  routes:[
  //   GoRoute(
  //     path: "/",
  //     builder: (context, state) => const LoginPage(),
  //   routes: [
  //     ShellRoute(
  //     routes: [
  //       GoRoute(path: "main",
  //        builder: (context, state) => const BusBookingHomeScreen(),
  //       ),
  //       GoRoute(path: "detail",
  //        builder: (context, state) => const BusBookingDetailPage(),
  //       ),
  //       GoRoute(path: "seat",
  //        builder: (context, state) => const BusSeatPage(),
  //       ),
  //        GoRoute(path: "poojaseatpage",
  //        builder: (context, state) => const SeatPage(),
  //       )
  //     ],
  //    ),
  //   ],
  //   ),
  //  ],
  // );
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      // routerConfig: appRoute,
     debugShowCheckedModeBanner: false,
       initialRoute: '/login',
  routes: {
    '/login': (context) => LoginPage(),
    '/home':  (context) => BusBookingMainPage(),
    '/newseat' :(context) => BookingPage(bus: myBus),
    '/seat' :(context) => BusBookingPage(),
    '/map' :(context) => MyLocation(),
    // '/detail':(context) => BusBookingDetailPage(),
    // '/restaurantdetail':(context) => RestaurantDetail(),
  },
    );
  }
}
