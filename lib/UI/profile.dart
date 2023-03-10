import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/UI/profilewidget.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/profilescreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage("assets/123.webp"),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:  Colors.black,
                      width: 5.0,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      "Dineshram",
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                      // child: Image.asset('assets/verfi.jpg'),
                    )
                  ],
                ),
              ),
              Text(
                'dram@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  color:  Colors.black,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: size.height * .6,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector
                    ( onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileNav(),));
                      },
                      child: ProfileWidget(icon: Icons.person, title: 'My Profile')),
                    ProfileWidget(icon: Icons.settings, title: 'Settings'),
                    ProfileWidget(
                        icon: Icons.notifications, title: 'Notification'),
                    ProfileWidget(icon: Icons.chat, title: 'FAQs'),
                    ProfileWidget(icon: Icons.share, title: 'Share'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      },
                      child: ProfileWidget(
                        icon: Icons.logout,
                        title: 'Log Out',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
