import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({super.key});

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.red,
        title: Text("Offers for you"),),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/emtbus-28apr-mob.png"),
                  fit: BoxFit.fill,
                  )
                ),
              
                height: 200,
                width: 400,
              ),
              ),
            Container(
               decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/bus-coupons.jpg"),
                  
                  )
                ),
                height: 200,
                width: 400,
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/Paytm-Bus-Ticket-Coupons.png"),
                  fit: BoxFit.fill,
                  )
                ),
                height: 200,
                width: 400,
              ),
                SizedBox(height: 10,),
              Container(
                 decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/my-bus-1541400597.webp"),
                  fit: BoxFit.fill,
                  )
                ),
                height: 200,
                width: 400,
              ),
          ],
        ),
      ) ,
    );
  }
}