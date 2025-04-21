import 'package:flutter/material.dart';

class SignIn_UpButton extends StatelessWidget {
  const SignIn_UpButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.buttonTextColor,
    required this.onClick,
    required this.border,
  });

  final Color buttonColor;
  final String buttonText;
  final Color buttonTextColor;
  final VoidCallback onClick;
  final double border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: border, color: Colors.black)),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20, color: buttonTextColor),
          ),
        ),
      ),
    );
  }
}
