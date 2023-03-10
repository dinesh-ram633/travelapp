// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});
//   void initStripePayment() {
//   StripePayment.setOptions(
//     StripeOptions(
//       publishableKey: "your-publishable-key",
//       merchantId: "your-merchant-id",
//       androidPayMode: 'test',
//     ),
//   );
// }
// Future<void> createPaymentMethod() async {
//   CardFormPaymentRequest paymentRequest = CardFormPaymentRequest();
//   paymentRequest.theme = ThemeData(
//     primaryColor: Colors.deepPurpleAccent,
//   );
//   PaymentMethod paymentMethod = await StripePayment.paymentRequestWithCardForm(
//     paymentRequest,
//   );
//   // Send the paymentMethod.id to your backend API to create a charge
  
// }



//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatefulWidget {
  // final double totalPrice;
    // PaymentScreen({Key? key, required this.totalPrice}) : super(key: key);
  const PaymentScreen({super.key});

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
   'name': 'Travel App',
   'description': 'payment',
   'prefill': {'contact': '8667457165', 'email': 'dram@gmail.com.com'},
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
        title:const Text("Razor Pay"),
      ),
      body: Padding(padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
        //   Text(
        //   'Total Price: \$${totalPrice.toStringAsFixed(2)}',
        //   style: TextStyle(fontSize: 24),
        // ),
          
          TextField(
            controller: textEditingController,
            decoration:const InputDecoration(
              hintText: "Amount to pay"
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