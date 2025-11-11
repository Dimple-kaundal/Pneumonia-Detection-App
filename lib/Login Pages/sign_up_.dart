import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/AppBar/app_bar.dart';
import 'package:flutter_application_1/Reusable%20Widget/my_elevated_button.dart';
import 'package:flutter_application_1/Reusable%20Widget/my_textField.dart';
import 'package:flutter_application_1/Reusable%20Widget/searchable_dropdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../authentication/auth_providers.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Controllers
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final confirmPasswordController = TextEditingController();
    final TextEditingController categoryItem = TextEditingController();
    final nameController = TextEditingController();
    final aadharNumberController = TextEditingController();
    final phoneNumberController = TextEditingController();

    // Gender variable
    String? selectedGender;

    // Dropdown items (static list)
    final List<String> categoryItems = ["Health Worker", "Administrator"];

    // Auth state
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: CustomeAppBar(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// ================== CATEGORY DROPDOWN ==================
                  MySearchableDropdownenroll(
                    dropdownItems: categoryItems,
                    hintText: "select any",
                    controller: TextEditingController(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select category";
                      }
                      ;
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  /// ================== NAME FIELD ==================
                  CustomTextFormField(
                    controller: nameController,
                    label: "Full Name",
                  ),
                  const SizedBox(height: 12),

                  /// ================== EMAIL FIELD ==================
                  CustomTextFormField(
                    controller: emailController,
                    label: "Email",
                  ),
                  const SizedBox(height: 12),

                  /// ================== PASSWORD FIELD ==================
                  CustomTextFormField(
                    controller: passwordController,
                    label: "Password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),

                  /// ================== CONFIRM PASSWORD FIELD ==================
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    label: "Confirm Password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),

                  /// ================== AGE FIELD ==================
                  CustomTextFormField(
                    controller: aadharNumberController,
                    label: "Aadhar Number",
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text("IN +91"),
                          )
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Select Phone NUmber",
                      labelText: "Phone Number",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    
                  ),
                  const SizedBox(height: 12),

                  /// ================== GENDER RADIO BUTTONS ==================
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Row(
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
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  /// ================== SIGN UP BUTTON ==================
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
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                              return;
                            }

                            ref
                                .read(authProvider.notifier)
                                .signup(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                          },
                  ),

                  if (authState.error != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      authState.error!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
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
