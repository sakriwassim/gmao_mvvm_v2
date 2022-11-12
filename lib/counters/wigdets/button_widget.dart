import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String textbutton;
  final Function callbackFunction;
  const Button(
      {Key? key, required this.textbutton, required this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFFF8000),
        shadowColor: const Color.fromARGB(162, 255, 128, 0),
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {
        callbackFunction();
      },
      child: Text(textbutton),
    );
  }
}
