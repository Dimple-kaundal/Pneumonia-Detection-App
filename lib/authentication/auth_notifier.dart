// auth_notifier.dart
import 'package:flutter_application_1/authentication/auth_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  // fake database of users
  final Map<String, String> _users = {};

  // login method
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    await Future.delayed(const Duration(seconds: 1)); // simulate API delay

    if (_users.containsKey(email)) {
      if (_users[email] == password) {
        // success → set dummy user
        final dummyUser = User(id: "1", name: "Test User", email: email);
        state = state.copyWith(
          isLoading: false,
          isLoggedIn: true,
          user: dummyUser,
        );
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
    final dummyUser = User(id: "2", name: "New User", email: email);
    state = state.copyWith(isLoading: false, isLoggedIn: true, user: dummyUser);
  }

  void logout() {
    state = AuthState(); // reset to initial state
  }
}
