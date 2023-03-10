import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/UI/seat.dart';
import 'package:travel_app/newseat.dart';

class BusBookingDetailPage extends StatelessWidget {
  final String textFieldValue;
  final String textFieldValue1;
  const BusBookingDetailPage({Key? key, required this.textFieldValue,required this.textFieldValue1}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text("Booking Page",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
        ),
        body: Column(
          children: [
            // Container(
            //   height: 64,
            //   color: Colors.blue,
            //   child: Text("choose"),
            // ),
            Container(
              margin: const EdgeInsets.all(16),
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Text(textFieldValue,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.red),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text("To",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                  ),
                  Text(textFieldValue1,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.red))
                ],
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(onPressed: (() {
                    
              //     }), icon: const Icon(Icons.filter_list_outlined,),
              //     ),
              //     const Text("Search for Trips",style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold
              //     ),)
              //   ],
              // ),
            ),
            const Divider(),
           Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SRM",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("Semi Sleeper",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                              Text("Non AC",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Departure",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("8:00PM",style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ),
                              Text(textFieldValue,style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.accessible),
                            Icon(Icons.work),
                            Icon(Icons.electrical_services),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(bus: myBus),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(32)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text.rich(TextSpan(
                              children: [
                                TextSpan(text: "Rs.650",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                                TextSpan(text: " per ticket",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),)
                              ],
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("YBM",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("Sleeper",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                              Text("AC",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Departure",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("8:30PM",style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ),
                              Text(textFieldValue,style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.accessible),
                            Icon(Icons.work),
                            Icon(Icons.electrical_services),
                            Icon(Icons.wifi),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(bus: myBus),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(32)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text.rich(TextSpan(
                              children: [
                                TextSpan(text: "Rs.900",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                                TextSpan(text: " per ticket",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),)
                              ],
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("RKT",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("Semi Sleeper",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                              Text("AC",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Departure",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("10:00PM",style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ),
                              Text(textFieldValue,style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.accessible),
                            Icon(Icons.work),
                            Icon(Icons.electrical_services),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(bus: myBus),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(32)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text.rich(TextSpan(
                              children: [
                                TextSpan(text: "Rs.750",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                                TextSpan(text: " per ticket",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),)
                              ],
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Renu",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("Sleeper",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                              Text("AC",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Departure",style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("11:00PM",style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ),
                              Text(textFieldValue,style: TextStyle(
                                   fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.accessible),
                            Icon(Icons.work),
                            Icon(Icons.electrical_services),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(bus: myBus),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(32)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text.rich(TextSpan(
                              children: [
                                TextSpan(text: "Rs.850",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                                TextSpan(text: " per ticket",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),)
                              ],
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                )
    
              ],
            ),
           )),
          ],
        ),
      ),
    );
  }
}