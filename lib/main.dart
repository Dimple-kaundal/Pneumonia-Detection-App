import 'package:flutter/material.dart';
import 'package:flutter_application_1/home%20Pages/welcome_page.dart';
import 'package:flutter_application_1/test_sound_bluetooth.dart';
import 'package:flutter_application_1/testing_sound.dart' hide LungRecorder;
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LungRecorder());
  }
}
