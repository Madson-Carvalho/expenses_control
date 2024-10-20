import 'package:expenses_control/widgets/custom_password_input.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFFF1FFF3),
      appBar: AppBar(
        title: const Text(
          'Cadastro',
          style:
              TextStyle(color: Color(0xFF093030), fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF00D09E),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomInput(
                controller: TextEditingController(),
                labelText: "Nome",
                icon: const Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomInput(
                controller: TextEditingController(),
                labelText: "Email",
                icon: const Icon(Icons.email),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomPasswordInput(
                labelText: "Senha",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomPasswordInput(
                labelText: "Confirma  Senha",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomButton(
                titleButton: "Cadastrar",
                backgroundColor: const Color(0xFF00D09E),
                color: const Color(0xFF093030),
              ),
            )
          ],
        ),
      ),
    );
  }
}
