// auth_notifier.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/auth_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  // fake database of users
  final Map<String, String> _users = {};

  // Controllers for login form
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // login method (with auto signup if user doesn't exist)
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    await Future.delayed(const Duration(seconds: 1)); // simulate API delay

    if (_users.containsKey(email)) {
      if (_users[email] == password) {
        // success
        state = state.copyWith(isLoading: false, isLoggedIn: true);
      } else {
        // wrong password
        state = state.copyWith(
          isLoading: false,
          isLoggedIn: false,
          error: "Wrong password",
        );
      }
    } else {
      // if user does not exist → signup automatically
      await signup(email, password);
    }
  }

  // signup method
  Future<void> signup(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    await Future.delayed(const Duration(seconds: 1)); // simulate API delay

    _users[email] = password; // save new user
    state = state.copyWith(isLoading: false, isLoggedIn: true);
  }

  void logout() {
    state = AuthState(); // reset to initial state
  }
}

// provider
final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
