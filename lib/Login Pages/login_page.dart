import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login%20Pages/sign_up_.dart';
import 'package:flutter_application_1/Reusable%20Widget/my_elevated_button.dart';
import 'package:flutter_application_1/Reusable%20Widget/my_textField.dart';
import 'package:flutter_application_1/home%20Pages/record_sound.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../authentication/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final authState = ref.watch(authProvider);
        ref.listen(authProvider, (previous, next) {
      if (next.user != null && !next.isLoading) {
        // If login successful → navigate to RecordingScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const RecordingScreen()),
        );
      }
    });
    

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: emailController,
                  label: "Email",
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  controller: passwordController,
                  label: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                // Use only ONE login button (CustomElevatedButton)
                CustomElevatedButton(
                  text: authState.isLoading ? "Loading..." : "Login",
                  onPressed: authState.isLoading
                      ? null
                      : () {
                          ref
                              .read(authProvider.notifier)
                              .login(
                                emailController.text,
                                passwordController.text,
                              );
                        },
                ),

                if (authState.isLoading) ...[
                  const SizedBox(height: 10),
                  const CircularProgressIndicator(),
                ],

                if (authState.error != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    authState.error!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ],

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: const Text("Don’t have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
