import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    this.buttonIcon,
    required this.navigate,
  });

  final Color buttonColor;
  final String buttonText;
  final Icon? buttonIcon;
  final VoidCallback navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: buttonColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: buttonIcon),
              const SizedBox(
                width: 20,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
