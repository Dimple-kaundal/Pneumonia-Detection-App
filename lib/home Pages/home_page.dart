import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppBar/app_bar.dart';
import 'package:flutter_application_1/Colors/colors.dart';
import 'package:flutter_application_1/Login%20Pages/login_page.dart';
import 'package:flutter_application_1/home%20Pages/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appbarWidget(),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("Assets/images/stetho.jpg", fit: BoxFit.cover),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digital Stethoscope based prediatric pulmonary care at your door steps",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 10),
                Text(
                  "Aim at using  multi-modal analysis approach to aid early diagnosis and monitoring of pediatric pneumonia,  'as a virtual assistant' available for the remote non-specialist medico.",
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          myText("MyStetho.ai"),
          Expanded(
            child: Center(
              child: Image.asset("assets/images/cdaclogo.png", height: 35),
            ),
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: myText("Home"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          },
          child: myText("Diagnose"),
        ),
        TextButton(onPressed: () {}, child: myText("About")),
        TextButton(onPressed: () {}, child: myText("Credit")),
        TextButton(onPressed: () {}, child: myText("Contact")),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: myText("Logout"),
        ),
      ],
    );
  }
}

Widget myText(String text) {
  return Text(text, style: TextStyle(color: Colors.white));
}
