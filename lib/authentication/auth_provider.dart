import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Auth State
class AuthState {
  final bool isLoggedIn;
  final String? email;

  AuthState({required this.isLoggedIn, this.email});
}

/// Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(isLoggedIn: false));

  void login(String email, String password) {
    // TODO: replace with real API call
    if (email.isNotEmpty && password.isNotEmpty) {
      state = AuthState(isLoggedIn: true, email: email);
    }
  }

  void logout() {
    state = AuthState(isLoggedIn: false);
  }
}

/// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
