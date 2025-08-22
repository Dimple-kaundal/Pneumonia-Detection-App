// auth_state.dart
class AuthState {
  final bool isLoading;     // true when login/signup API is running
  final bool isLoggedIn;    // true if user is logged in
  final String? error;      // holds error message if login fails

  AuthState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.error,
  });

  // Copy method so we can update values immutably
  AuthState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      error: error,
    );
  }
}
