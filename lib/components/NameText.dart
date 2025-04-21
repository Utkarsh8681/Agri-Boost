import 'package:flutter/material.dart';

class PageText extends StatelessWidget {
  const PageText({
    super.key,
    required this.frontText,
  });
  final String frontText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        frontText,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class text_field_name extends StatelessWidget {
  const text_field_name({
    super.key,
    required this.fieldName,
  });
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        fieldName,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
