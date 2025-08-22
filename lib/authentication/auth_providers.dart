import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_notifier.dart';
import 'auth_state_model.dart';

// controllers
final emailControllerProvider =
    Provider.autoDispose((ref) => TextEditingController());
final passwordControllerProvider =
    Provider.autoDispose((ref) => TextEditingController());

// main auth provider
final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
