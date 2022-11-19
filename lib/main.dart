import 'package:flutter/material.dart';
import 'package:gmao_mvvm_v2/entry/splash_screen.dart';

import 'counters/views_events/counters_view.dart';
import 'mesures/views_mesures/mesures_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
