import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/auth.dart';
import 'package:travel_app/login.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formkey = GlobalKey<FormState>();

  final firstNameEditingcontroller = new TextEditingController();
  final secondNameEditingcontroller = new TextEditingController();
  final emailEditingcontroller = new TextEditingController();
  final passwordEditingcontroller = new TextEditingController();
  final confirmpasswordEditingcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNamefield = TextFormField(
        autofocus: false,
        controller: firstNameEditingcontroller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            hintText: "first Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
    final secondNamefield = TextFormField(
        autofocus: false,
        controller: secondNameEditingcontroller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            hintText: "second Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
    final emailfield = TextFormField(
        autofocus: false,
        controller: emailEditingcontroller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
    final passwordfield = TextFormField(
        autofocus: false,
        controller: passwordEditingcontroller,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
    final confirmpasswordfield = TextFormField(
        autofocus: false,
        controller: confirmpasswordEditingcontroller,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            hintText: "Confirm password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () async {
          await Authenticationservice(FirebaseAuth.instance)
              .firebaseregister(emailEditingcontroller.text.trim(),
                  passwordEditingcontroller.text.trim())
              .then((value) {
            if (value == "signed up") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("please Enter Your Email")));
            }
          });
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              color: Colors.white,
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      firstNamefield,
                      SizedBox(
                        height: 20,
                      ),
                      secondNamefield,
                      SizedBox(
                        height: 20,
                      ),
                      emailfield,
                      SizedBox(
                        height: 20,
                      ),
                      passwordfield,
                      SizedBox(
                        height: 20,
                      ),
                      confirmpasswordfield,
                      SizedBox(
                        height: 20,
                      ),
                      signUpButton,
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
