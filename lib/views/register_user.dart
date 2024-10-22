import 'package:expenses_control/widgets/custom_password_input.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import 'home_page.dart';

class RegisterUser extends StatelessWidget {
  RegisterUser({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FFF3),
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
                controller: nameController,
                labelText: "Nome",
                icon: const Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomInput(
                controller: emailController,
                labelText: "Email",
                icon: const Icon(Icons.email),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomPasswordInput(
                labelText: "Senha",
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomPasswordInput(
                labelText: "Confirma  Senha",
                controller: confirmPasswordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomButton(
                titleButton: "Cadastrar",
                backgroundColor: const Color(0xFF00D09E),
                color: const Color(0xFF093030),
                onPressed: () async {
                  try {
                    if (passwordController.text == confirmPasswordController.text) {
                      await FirebaseAuthService()
                          .saveUser(emailController.text, passwordController.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("As senhas não iguais..."),
                      ));
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Usuário ou senha incorreta..."),
                    ));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
