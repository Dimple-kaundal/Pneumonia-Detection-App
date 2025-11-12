import 'package:flutter/material.dart';
import 'package:flutter_application_1/home%20Pages/home_page.dart';
import 'package:flutter_application_1/home%20Pages/start_ausculation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     home: StartAusculation());
    // home: OrderStepsPage());
  }
}
