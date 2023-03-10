import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/UI/bus_booking_home_screen.dart';
import 'package:travel_app/UI/profile.dart';
import 'package:travel_app/coupon.dart';

final busTicketAppMenuIndex = StateProvider<int>((ref)=> 0);
class BusBookingMainPage extends StatefulWidget {
  const BusBookingMainPage({super.key});

  @override
  State<BusBookingMainPage> createState() => _BusBookingMainPageState();
}

class _BusBookingMainPageState extends State<BusBookingMainPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        final index = ref.watch(busTicketAppMenuIndex);
        return Scaffold(
          body: SafeArea(
            top: true,
            child: IndexedStack(
              index: index,
              children: [
                const BusBookingHomeScreen(),
                 CouponPage(),
                 ProfilePage(),
             ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              elevation: 4,
              selectedItemColor: Colors.red,
              currentIndex: index,
              onTap: (idx)=>ref.read(busTicketAppMenuIndex.notifier).state=idx,
              items: const [
                 BottomNavigationBarItem(icon:Icon(Icons.search),label: "Booking",),
                 BottomNavigationBarItem(icon:Icon(Icons.local_offer_outlined),label: "Offers",),
                 BottomNavigationBarItem(icon:Icon(Icons.person_outlined),label: "Profile",)
              ],
               ),
          ),
        );
      }
    );
  }
}