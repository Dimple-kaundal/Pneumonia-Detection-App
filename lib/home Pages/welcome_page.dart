import 'package:flutter/material.dart';
import 'package:flutter_application_1/Colors/colors.dart';
import 'package:flutter_application_1/Login Pages/login_page.dart';
import 'package:flutter_application_1/Login%20Pages/sign_up_.dart';
import 'package:flutter_application_1/Reusable Widget/my_elevated_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.local_hospital,
                  size: 100,
                  color: AppColors.iconColor,
                ),
                const SizedBox(height: 20),
                const Text(
                  "My STETHO",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                /// 👇 Navigates to SignInPage
                CustomElevatedButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                ),
                SizedBox(height: 10),
                CustomElevatedButton(
                  backgroundColor: Colors.white,
                  textColor: AppColors.buttonColor,
                  borderColor: AppColors.buttonColor,
                  text: "Sign Up",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
