import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String titleButton;
  Color backgroundColor;
  Color color;
  VoidCallback? onPressed;

  CustomButton(
      {super.key,
      required this.titleButton,
      required this.backgroundColor,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          titleButton,
          style: const TextStyle(
              color: Color(0xFF093030), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
