import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:travel_app/newseat.dart';
import 'package:travel_app/payment.dart';

class NewCheck1 extends StatefulWidget {
  final List<Seat> selectedSeats;
    final double totalPrice;

  NewCheck1({required this.selectedSeats,required this.totalPrice});

  @override
  State<NewCheck1> createState() => _NewCheck1State();
}

class _NewCheck1State extends State<NewCheck1> {
 @override 


@override 
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Seats:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: widget.selectedSeats
                  .map((seat) => Text(
                        'Seat ${seat.number}',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ))
                  .toList(),
            ), SizedBox(height: 16),
             Text(
              'Total Price : \Rs.${widget.totalPrice}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>PaymentScreen(totalPrice: widget.totalPrice),
                  ),
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
