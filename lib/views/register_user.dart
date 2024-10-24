import 'package:expenses_control/widgets/base_page.dart';
import 'package:expenses_control/widgets/custom_password_input.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class RegisterUser extends StatelessWidget {
  RegisterUser({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Cadastro',
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
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        await FirebaseAuthService().register(
                            nameController.text,
                            emailController.text,
                            passwordController.text);

                        Navigator.pushReplacementNamed(context, '/');
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("As senhas não iguais..."),
                        ));
                      }
                    } catch (e) {
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
      ),
    );
  }
}
