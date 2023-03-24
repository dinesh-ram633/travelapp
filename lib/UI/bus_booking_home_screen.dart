import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/UI/bus_booking_detail_page.dart';
import 'package:travel_app/date.dart';
import 'package:travel_app/map.dart';

class BusBookingHomeScreen extends StatefulWidget {
  const BusBookingHomeScreen({super.key});
  @override
  State<BusBookingHomeScreen> createState() => _BusBookingHomeScreenState();
}

class _BusBookingHomeScreenState extends State<BusBookingHomeScreen> {
   final _formkey = GlobalKey<FormState>();

  String _name = '';
  bool tripType = false;
  String _textFieldValue = '';
  String _textFieldValue1 = '';
  TextEditingController _fromtex = TextEditingController();
  TextEditingController _totex = TextEditingController();
  int _counter =0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Current location",
                suffixIcon: IconButton(onPressed: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyLocation(),));
                }), icon: Icon(Icons.my_location))
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text("Book tickets for your",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 8,
            ),
            const Text("next trip",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 32),
                height: 58,
                width: MediaQuery.of(context).size.width-160,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                child: Row(
                  children: [
                    Expanded(child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tripType = true;
                        });
                      },
                      child: tripType 
                      ? Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(32)
                        ),
                       child: const Center(
                        child: Text("One Way",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                       ),
                      )
                       : const Center(
                        child: Text("One Way",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      ),
                      ),
                    Expanded(child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tripType = false;
                        });
                      },
                      child: !tripType 
                      ? Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(32)
                        ),
                       child: const Center(
                        child: Text("Round Trip",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                       ),
                      )
                       : const Center(
                        child: Text("Round Trip",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                          ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 140,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(6)
                              ),
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Row(
                                  children: [
                         Text("From",style: TextStyle(fontSize: 20),),
                        const SizedBox(
                          width: 14,
                        ),
                         Expanded(
                          child: TextFormField(
                                     validator: (value) {
                                      if (value!.isEmpty) {
                                      return 'Please enter your pickup point';
                                     }
                                     return null;
                                     },
                                    onSaved: (value) {
                                    _name = value!;
                                     },
                                    onChanged:((value) {
                                      _textFieldValue = value;
                                    }
                                    ),
                                    controller: _fromtex,
                                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
                                    decoration: InputDecoration(
                                     suffixIcon: Icon(Icons.add_location), 
                                    border: InputBorder.none,
                                    ),
                                
                                
                                  ),
                        ),
                     
                    ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Row(
                                  children: [
                        const Text("To",style: TextStyle(fontSize: 20),),
                        const SizedBox(
                          width: 14,
                        ),
                         Expanded(
                          child: TextFormField(
                          
                              onChanged:((value) {
                                      _textFieldValue1 = value;
                                    }
                                    ),
                    
                                    
                            controller: _totex,
                                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
                                    decoration: InputDecoration(                                     
                                    border: InputBorder.none,
                                    ),                                    
                                  ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        // IconButton(onPressed: (() {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyLocation(),));
                        // }), icon: Icon(Icons.add_location))
                     ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    top: 16,
                    child: GestureDetector(
                      onTap: (() {
                        setState(() {
                           final tapText = _fromtex.text;
                          _fromtex.text = _totex.text;
                        _totex.text = tapText;
                           });
                         }),
                      child: Center(
                        child: CircleAvatar(
                          radius: 16,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.sync),
                      ),
                      ),
                    ),),
                ],
              ),
            ),
         
            DatePage(),

            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         children: [
            //           DatePage(),
            //           // const Text("Date"),
            //           // SizedBox(height: 16,),
            //           // const Text("01.02.2022",style: TextStyle(
            //           //   fontWeight: FontWeight.bold,
            //           //   fontSize: 18
            //           // ),)
            //         ],
            //       ),
            //     ),
                
            //     //  Expanded(
            //     //    child: Column(
            //     //     crossAxisAlignment: CrossAxisAlignment.start,
            //     //     children: [
            //     //       const Text("Returning"),
            //     //       SizedBox(height: 16,),
            //     //       const Text("Set Date",style: TextStyle(
            //     //         fontWeight: FontWeight.bold,
            //     //         fontSize: 18
            //     //       ),)
            //     //     ],
            //     //                ),
            //     //  )
            //   ],
            // ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Passengers",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                Container(
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.red,width: 1.5)
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (() {
                        _counter--;
                        if(_counter <= 1) _counter =1;
                        setState(() {
                          
                        });
                      }), icon: Icon(Icons.remove,
                      color: _counter == 1 ? Colors.grey : Colors.black,
                      )),
                      Text("$_counter",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                      IconButton(onPressed: (() {
                        setState(() {
                          _counter++;
                        });
                      }), icon: Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 32,),
            Text("Do you have promocode",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
            SizedBox(height: 32,),
               
            
            GestureDetector(
              onTap: () {
              
                Navigator.push(context,MaterialPageRoute(builder: (context) => BusBookingDetailPage(
                  textFieldValue: _textFieldValue,
                  textFieldValue1: _textFieldValue1,
                  ), ) );
              },
              child: Container(
                decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(48)
                ),
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 12,),
                    Text("Search for Trips",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}  