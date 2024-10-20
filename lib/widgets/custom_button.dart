import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String titleButton;
  Color backgroundColor;
  Color color;

  CustomButton(
      {super.key,
      required this.titleButton,
      required this.backgroundColor,
      required this.color});

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
        onPressed: () async {
          try {
            // await FirebaseAuthService().login();
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const HomePage(),
            //     ));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Usuário ou senha incorreta..."),
            ));
          }
        },
        child: Text(
          titleButton,
          style: const TextStyle(
              color: Color(0xFF093030), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
