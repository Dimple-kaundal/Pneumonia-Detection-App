import 'package:flutter/material.dart';
import 'package:flutter_application_1/home Pages/home_page.dart';
import 'package:flutter_application_1/home Pages/welcome_page.dart';
import 'package:flutter_application_1/Colors/colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  // Required for AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _myText("MyStetho.ai"),
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: _myText("Home"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomePage()),
            );
          },
          child: _myText("Diagnose"),
        ),
        TextButton(onPressed: () {}, child: _myText("About")),
        TextButton(onPressed: () {}, child: _myText("Credit")),
        TextButton(onPressed: () {}, child: _myText("Contact")),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
          child: _myText("Logout"),
        ),
      ],
    );
  }

  Widget _myText(String text) =>
      Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
}
