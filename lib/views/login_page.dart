import 'package:expenses_control/widgets/base_page.dart';
import 'package:expenses_control/widgets/custom_password_input.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Bem-Vindo',
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.symmetric(vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton(
                  titleButton: "Entrar",
                  backgroundColor: const Color(0xFF00D09E),
                  color: const Color(0xFF093030), onPressed: () {  },
                  // onPressed: () async {
                  //   try {
                  //     if (passwordController.text ==
                  //         confirmPasswordController.text) {
                  //       await FirebaseAuthService().register(
                  //           nameController.text,
                  //           emailController.text,
                  //           passwordController.text);
                  //
                  //       Navigator.pushReplacementNamed(context, '/');
                  //     } else {
                  //       ScaffoldMessenger.of(context)
                  //           .showSnackBar(const SnackBar(
                  //         content: Text("As senhas não iguais..."),
                  //       ));
                  //     }
                  //   } catch (e) {
                  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //       content: Text("Usuário ou senha incorreta..."),
                  //     ));
                  //   }
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF093030),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register-user');
                  },
                  child: CustomButton(
                    titleButton: "Cadastre-se",
                    backgroundColor: const Color(0xFFDFF7E2),
                    color: const Color(0xFF093030),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register-user');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: const Text(
                    "or sign up whith",
                    style: TextStyle(
                      color: const Color(0xFF093030),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/facebook.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    'assets/images/google.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    'assets/images/github.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
