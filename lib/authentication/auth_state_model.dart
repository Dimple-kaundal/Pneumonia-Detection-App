class AuthState {
  final bool isLoading; // true when login/signup API is running
  final bool isLoggedIn; // true if user is logged in
  final String? error; // holds error message if login fails
  final User? user; // Firebase user

  AuthState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.error,
    this.user,
  });

  // Copy method so we can update values immutably
  AuthState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? error,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      error: error,
      user: user ?? this.user,
    );
  }
}

// user_model.dart
class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}
