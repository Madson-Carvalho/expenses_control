import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String labelText;
  bool obscure;
  TextEditingController controller;
  int? maxLines;

  CustomInput(
      {super.key,
      required this.labelText,
      this.obscure = false,
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
          filled: true,
          fillColor: const Color(0xFFDFF7E2),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
