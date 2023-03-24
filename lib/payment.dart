import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatefulWidget {
  final double totalPrice;
    // PaymentScreen({Key? key, required this.totalPrice}) : super(key: key);
  const PaymentScreen({super.key, required this.totalPrice});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

late Razorpay razorpay;
TextEditingController textEditingController = TextEditingController();

  

  get totalPrice => null;

@override 
void initState(){
  super.initState();

  razorpay =  Razorpay();
  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
}

@override 
void dispose(){
  super.dispose();
  razorpay.clear();
}

void openCheckout(){
  var options = {
   'key': 'rzp_test_F9Jzc1xWmHg2z9',
   'amount': num.parse(textEditingController.text)*100,
   'name': 'Tripy',
   'description': 'payment',
   'prefill': {'contact': '8667457165', 'email': 'dram@gmail.com'},
   'external': {
   'wallets': ['paytm']
                    }
  };

  try {
    razorpay.open(options);
  } catch (e) {
    print(e.toString());
  }
}

void handlerPaymentSuccess(){
  print("Payment success");
  Fluttertoast.showToast(msg: "Payment Success");
}

void handlerErrorFailure(){
  print("payment Failed");
  Fluttertoast.showToast(msg: "Payment Failed");
}

void handlerExternalWallet(){
  print("External Wallet");
  Fluttertoast.showToast(msg: "External Wallet");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Payment",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Text(
          'Total Price: \Rs.${widget.totalPrice.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20,),
         TextField(
            controller: textEditingController,
            decoration:const InputDecoration(
              hintText: "Enter your Amount",
            ),
          ),
        const  SizedBox(height: 12,),
          ElevatedButton(
            onPressed: () {
            openCheckout();
          }, 
          child:const Text("Pay Now", style: TextStyle(
            color: Color.fromARGB(255, 121, 28, 28)
          ),),),
        ],
      )
      ),
    );
  }
}