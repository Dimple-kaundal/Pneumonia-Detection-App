import 'package:flutter/material.dart';
import 'package:flutter_application_1/Reusable%20Widget/my_elevated_button.dart';
import 'package:flutter_application_1/Reusable%20Widget/my_textField.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../authentication/auth_providers.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final confirmPasswordController = TextEditingController();
    final nameController = TextEditingController();
    final ageController = TextEditingController();

    String? selectedGender; // Male / Female / Other

    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 500,
            child: SingleChildScrollView( // ✅ prevents overflow
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Name
                  CustomTextFormField(
                    controller: nameController,
                    label: "Full Name",
                  ),
                  const SizedBox(height: 12),

                  // Email
                  CustomTextFormField(
                    controller: emailController,
                    label: "Email",
                  ),
                  const SizedBox(height: 12),

                  // Password
                  CustomTextFormField(
                    controller: passwordController,
                    label: "Password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),

                  // Confirm Password
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    label: "Confirm Password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),

                  // Age
                  CustomTextFormField(
                    controller: ageController,
                    label: "Age",
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),

                  // Gender Radio Buttons
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<String>(
                            value: "Male",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() => selectedGender = value);
                            },
                          ),
                          const Text("Male"),
                          Radio<String>(
                            value: "Female",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() => selectedGender = value);
                            },
                          ),
                          const Text("Female"),
                          Radio<String>(
                            value: "Other",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() => selectedGender = value);
                            },
                          ),
                          const Text("Other"),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // ✅ Custom Elevated Button
                  CustomElevatedButton(
                    text: "Sign Up",
                    onPressed: authState.isLoading
                        ? null
                        : () {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Passwords do not match"),
                                ),
                              );
                              return;
                            }

                            ref.read(authProvider.notifier).signup(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  // You can later extend signup() to accept
                                  // name, gender, age as well
                                );
                          },
                  ),

                  if (authState.error != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      authState.error!,
                      style:
                          const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
