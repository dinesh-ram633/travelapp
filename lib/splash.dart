import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel_app/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => LoginPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [Image.asset("assets/original-f6ac5f1e412b80da59bcf4eaff521100.webp",
              fit: BoxFit.fill,
              height: 718,
              width: 400,),
               Positioned(
                bottom: 120,
                left: 100,

                 child: Text(
                  'Tripy',
                  style: TextStyle(
                      color: Color.fromARGB(255, 250, 248, 248),
                      fontWeight: FontWeight.w700,
                      fontSize: 75),
                             ),
               ),
              SizedBox(
                height: 20,
              ),
              ]),
             
              // CircularProgressIndicator(
              //   color: Colors.black54,
              // )
            ],
          ),
        ),
      ),
    );
  }
}