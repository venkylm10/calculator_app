import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? tColor;
  final Color? bgColor;
  final VoidCallback onPressed;
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.tColor = Colors.white,
    this.bgColor = buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: bgColor,
            padding: const EdgeInsets.all(22),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
