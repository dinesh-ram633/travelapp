import 'package:flutter/material.dart';
import 'package:travel_app/payment.dart';

class Seat {
  int number;
  bool isAvailable;

  Seat({required this.number, required this.isAvailable});
}

class Bus {
  List<Seat> seats;

  Bus({required this.seats});
}
Bus myBus = Bus(
  seats: [
    Seat(number: 1, isAvailable: true),
    Seat(number: 2, isAvailable: false),
    Seat(number: 3, isAvailable: true),
    Seat(number: 4, isAvailable: true),
    Seat(number: 5, isAvailable: false),
    Seat(number: 6, isAvailable: true),
    Seat(number: 7, isAvailable: true),
    Seat(number: 8, isAvailable: false),
    Seat(number: 9, isAvailable: true),
    Seat(number: 10, isAvailable: false),
    Seat(number: 11, isAvailable: true),
    Seat(number: 12, isAvailable: true),
    Seat(number: 13, isAvailable: true),
    Seat(number: 14, isAvailable: true),
    Seat(number: 15, isAvailable: true),
    Seat(number: 16, isAvailable: false),
    Seat(number: 17, isAvailable: false),
    Seat(number: 18, isAvailable: false),
    Seat(number: 19, isAvailable: true),
    Seat(number: 20, isAvailable: true),
    Seat(number: 21, isAvailable: true),
    Seat(number: 22, isAvailable: true),
    Seat(number: 23, isAvailable: true),
    Seat(number: 24, isAvailable: true)
  ],
);

class Ticket {
  final double basePrice;
  final double taxRate;

  Ticket({required this.basePrice, required this.taxRate});

  double calculatePrice() {
    return basePrice + (basePrice * taxRate);
  }
}

class BookingPage extends StatefulWidget {
  final Bus bus;

  BookingPage({required this.bus});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<Seat> selectedSeats = [];

  void bookSeat(Seat seat) {
    setState(() {
      seat.isAvailable = false;
      selectedSeats.add(seat);
    });
  }

  void releaseSeat(Seat seat) {
    setState(() {
      seat.isAvailable = true;
      selectedSeats.remove(seat);
    });
  }
Ticket myTicket = Ticket(basePrice: 10.0, taxRate: 0.1);

  void freezeSeats() {
    double totalPrice = myTicket.calculatePrice() * selectedSeats.length;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Booking'),
          content: Text('Are you sure you want to book ${selectedSeats.length} seats?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                for (Seat seat in selectedSeats) {
                  seat.isAvailable = false;
                }
                selectedSeats.clear();
                Navigator.push(context,MaterialPageRoute(builder: (context) =>PaymentScreen(),));
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Seat Booking'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 18,
              ),
              itemCount: widget.bus.seats.length,
              itemBuilder: (context, index) {
                Seat seat = widget.bus.seats[index];
                return GestureDetector(
                  onTap: () {
                    if (seat.isAvailable) {
                      bookSeat(seat);
                    } else {
                      releaseSeat(seat);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: seat.isAvailable ? Colors.green : Colors.red,
                      
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        seat.number.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedSeats.length} seats selected',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedSeats.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select at least one seat'),
                        ),
                      );
                    } else {
                      freezeSeats();
                    }
                  },
                  child: Text('Book'),
                  ),
         ],
          ),
         ) 
       
        ]));
  }}