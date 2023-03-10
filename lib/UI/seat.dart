import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/UI/bus_booking_home_screen.dart';
import 'package:travel_app/UI/bus_booking_main_page.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  var CountSeatLeft = 2*7;
  // var CountSeatCenter = 3*10;
  var CountSeatRight = 2*7;
  var ListSeatLeft =[];
  // var ListSeatCenter =[];
  var ListSeatRight = [];
  @override
  void initState() {
    initSeatValueToList(ListSeatLeft, CountSeatLeft, "l");
    // initSeatValueToList(ListSeatCenter, CountSeatLeft, "c");
    initSeatValueToList(ListSeatRight, CountSeatLeft, "r");
    super.initState();
  }
  initSeatValueToList(List data, count, side){
    var objectData;
    for(int i= 0;i<count; i++){
      objectData = {
        "id":side+"${i+1}",
        "isSold":false,
        "isAvailable":true,
        "isSelected":false,
      };
      setState(() {
        data.add(objectData);
      }); 
    }
    print(data);
  }
  setSelectedToSold(){
    ListSeatLeft.forEach((seat) {
      if (seat["isSelected"]){
        setState(() {
          seat["isSold"]= true;
        });
      }
     });
    //  ListSeatCenter.forEach((seat) {
    //   if (seat["isSelected"]){
    //     setState(() {
    //       seat["isSold"]= true;
    //     });
    //   }
    //  });
     ListSeatRight.forEach((seat) {
      if (seat["isSelected"]){
        setState(() {
          seat["isSold"]= true;
        });
      }
     });
  }
  @override
  Widget build(BuildContext context) {
         final  size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //arrowbackbuttonwidget


            //movietitlewidget
            

            //information about seat
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //soldSeats
                  buildseatstatus(
                    color: Color.fromARGB(255, 180, 171, 171), 
                    content: "Sold"),
                    
                    //AvailableSeats
                  buildseatstatus(
                    color: Color.fromARGB(206, 1, 3, 10), 
                    content: "Available"),
                    
                    //SelectedSeats
                  buildseatstatus(
                    color: Color.fromARGB(255, 5, 58, 248), 
                    content: "Selected"),
                ],
              ),),

             
              //for seats
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: WidgetSeat(ListSeatLeft, false),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Expanded(
                      // child: WidgetSeat(ListSeatCenter, true),
                      // ),
                      SizedBox(
                        width: 10, 
                      ),
                      Expanded(
                      child: WidgetSeat(ListSeatRight, false),
                      ),
                  ],
                ),
              ),
              
              //Book Seats Button
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 13, 48, 224))
                  ),
                  onPressed: () {
                    setSelectedToSold();
                 Navigator.push(context,MaterialPageRoute(builder: (context) => BusBookingMainPage(),));
                  },
                  child: Text("Book Seats",
                  style: TextStyle(fontSize: 22),)),
              ),
              
    
           ] ),
           ),
    );
  }
////seatsbuilder
  Widget WidgetSeat(List dataSeat,bool isCenter){
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isCenter? 2:2),
          itemCount: dataSeat.length, 
        itemBuilder: (context, int index){
          return GestureDetector(
            onTap: () {
              setState(() {
                dataSeat[index]["isSelected"]=
                !dataSeat[index]["isSelected"];
              });
            },
            child: Container(
              margin: EdgeInsets.all(5),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: dataSeat[index]["isSold"]
                ?Colors.grey
                :dataSeat[index]["isSelected"]?Color.fromARGB(255, 5, 58, 248)
                :Colors.transparent,
                border: Border.all(color: Color.fromARGB(255, 4, 9, 14)),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          );
        }),
    );
  }
///buildseatmethods
  Row buildseatstatus({
    required Color color, 
    required String content
    }) {
    return Row(
                children: [
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(content,
                      style: TextStyle(
                        fontSize: 18
                      ),),
                    ),
                  ],
                );
  }
}