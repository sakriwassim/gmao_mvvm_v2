import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gmao_mvvm_v2/signin/signin_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../counters/views_events/counters_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  static bool _isSet = false;

  gettokenformpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      // print(token);
      return token;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    gettokenformpref();
    _navigatettohomepage();
    super.initState();
  }

  _navigatettohomepage() async {
    //await Future.delayed(const Duration(milliseconds: 1500), () {});
    Timer(Duration(seconds: 5), () async {
      if (token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetAllCounterView(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Signin(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isSet) {
      _navigatettohomepage();
      _isSet = true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo-G.png',
              height: 100,
              width: 50,
            ),
            const Text(
              'GMAOPRO',
              style: TextStyle(
                  // decoration: TextDecoration.underline,
                  color: Color(0xFFFF8000),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
