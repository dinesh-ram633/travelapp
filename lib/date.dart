import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _PickedDate = DateTime.now();
TimeOfDay _PickedTime = TimeOfDay.now();

String get getDate{
  return DateFormat("dd-MM-yyyy").format(_PickedDate);
}
String get getTime {
  final now = DateTime.now();
  final datetime = DateTime(now.year, now.month, now.day,
   _PickedTime.hour, _PickedTime.minute);
   return DateFormat("hh:mm a").format(datetime);
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Date of Booking",
              style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(
                height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ElevatedButton(
                      onPressed: () => openDaterPicker(),

                      child: Text("Pick Date",
                      style: TextStyle(
                        color: Colors.black,
                        
                        fontSize: 22
                      ),)),
                  ),
                    SizedBox(
                      width: 10),
                    Text(" $getDate",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                      ),),
                ],),
              SizedBox(
                height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ElevatedButton(
                      onPressed: () => openTimePicker(),
                      child: Text("Pick Time",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                      ),)),
                  ),
                    SizedBox(
                      width: 20),
                    Text(" $getTime ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                      ),),
                ],),
        ],
      ),
    );
  }
 Future <void> openDaterPicker() async{
    final PickedDate = await showDatePicker(
      context: context, 
      initialDate: _PickedDate, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2030, 12, 30));
      if (PickedDate != null){
        setState(() {
          _PickedDate = PickedDate;
        });}
  }

  Future <void> openTimePicker() async{
    final PickedTime = await showTimePicker(
      context: context, 
       initialTime: _PickedTime,
       );
      if (PickedTime != null){
        setState(() {
          _PickedTime = PickedTime;
        }); }
  }

}
