import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileNav extends StatefulWidget {
  const ProfileNav({super.key});

  @override
  State<ProfileNav> createState() => _ProfileNavState();
}

class _ProfileNavState extends State<ProfileNav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Profile"),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name"
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: " Email"
                ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Phone Number"
                ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Address"
                ),
            ),
          ],
        ),
      ),
    );
  }
}