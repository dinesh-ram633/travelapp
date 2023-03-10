import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class BusSeatPage extends StatefulWidget {
//   const BusSeatPage({super.key});

//   @override
//   State<BusSeatPage> createState() => _BusSeatPageState();
// }

// class _BusSeatPageState extends State<BusSeatPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: const Text("Select seats"),
//         titleTextStyle: TextStyle(
//           fontSize: 28,
//           fontWeight: FontWeight.w900,
//           color: Colors.black
//         ),
//         leading: IconButton(onPressed: (() {
//           context.pop();
//         }
//         ), icon: Icon(Icons.arrow_back_ios),
//         color: Colors.red,
//         ),
//         backgroundColor: Colors.grey[200],
//         elevation: 0,
//         foregroundColor: Colors.black,
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: 32,
//                   width: 32,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//                 Text("Standard",style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),),
//                 Container(
//                   height: 32,
//                   width: 32,
//                   decoration: BoxDecoration(
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//                 Text("Premium",style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),),
//                 Container(
//                   height: 32,
//                   width: 32,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Center(
//                     child: Icon(Icons.clear),
//                   ),
//                 ),
//                 Text("Taken",style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),)
//               ],
//             ),
//           ),
//           Expanded(child: Container(
//             margin: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//            child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(36),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 48,
//                         width: 48,
//                         margin: EdgeInsets.only(right: 16),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.red,
//                             width: 3 ),
//                             borderRadius: BorderRadius.circular(6)
//                         ),
//                         child: Center(
//                           child: Text("1",style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),),
//                         ),
//                       ),
//                       Container(
//                         height: 48,
//                         width: 48,
//                         margin: EdgeInsets.only(right: 16),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.red,
//                             width: 3 ),
//                             borderRadius: BorderRadius.circular(6)
//                         ),
//                         child: Center(
//                           child: Text("2",style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),),
//                         ),
//                       ),
//                       Spacer(),
//                       Container(
//                         height: 48,
//                         width: 48,
//                         margin: EdgeInsets.only(right: 16),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.red,
//                             width: 3 ),
//                             borderRadius: BorderRadius.circular(6)
//                         ),
//                         child: Center(
//                           child: Text("3",style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),),
//                         ),
//                       ),
//                       Container(
//                         height: 48,
//                         width: 48,
//                         margin: EdgeInsets.only(right: 16),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.red,
//                             width: 3 ),
//                             borderRadius: BorderRadius.circular(6)
//                         ),
//                         child: Center(
//                           child: Text("4",style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//            ),
//           ),)
//         ],
//       ),
//       bottomNavigationBar: SizedBox(
//         height: 84,
//         child: BottomAppBar(
//           elevation: 64,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
//             child: Row(
//             children: [
//               Text("seat:1/1",style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),),
//               SizedBox(width: 24,),
//               Expanded(child: Container(height: 54,
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(32)
//               ),
//               child: Center(
//                 child: Text("Confirm",style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),),
//               ),
//               ),
//               ),
//             ],
//             ),
//           ),
//           ),
//       ),
//     );
//   }
// }


class Seat {
  final String number;
  bool isSelected;

  Seat(this.number, this.isSelected);
}

class BusBookingPage extends StatefulWidget {
  @override
  _BusBookingPageState createState() => _BusBookingPageState();
}

class _BusBookingPageState extends State<BusBookingPage> {
  List<Seat> seats = [];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 30; i++) {
      seats.add(Seat(i.toString(), false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Select Seats',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: seats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      seats[index].isSelected = !seats[index].isSelected;
                    });
                  },
                  child: Container(
                    color: seats[index].isSelected ? Colors.green : Colors.grey,
                    child: Center(
                      child: Text(
                        seats[index].number,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Book Seats'),
            ),
          ],
        ),
      ),
    );
  }
}
