import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String labelText;
  bool obscure;
  Widget icon;
  TextEditingController controller;
  int? maxLines;

  CustomInput(
      {super.key,
      required this.labelText,
      this.obscure = false,
      required this.icon,
      required this.controller,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: icon,
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
