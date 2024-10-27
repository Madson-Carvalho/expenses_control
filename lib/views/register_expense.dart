import 'package:expenses_control/services/firestore_service.dart';
import 'package:expenses_control/widgets/base_page.dart';
import 'package:expenses_control/widgets/custom_button.dart';
import 'package:expenses_control/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterExpense extends StatelessWidget {
  RegisterExpense({super.key});

  final TextEditingController expenseController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  registerExpense() async {
    final String expenseName = expenseController.text;
    final String value = valueController.text;
    final String category = categoryController.text;
    final String date = dateController.text;
    final String comment = commentController.text;

    try {
      DateTime parsedDate = DateFormat("dd/MM/yyyy").parse(date);
      await FirestoreService().postRegisterExpense(
        expenseName,
        value,
        category,
        parsedDate, 
        comment,
      );

      expenseController.clear();
      valueController.clear();
      categoryController.clear();
      dateController.clear();
      commentController.clear();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Cadastro de Despesas',
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
                  controller: expenseController,
                  labelText: "Nome da despesa",
                  icon: const Icon(null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: valueController,
                  labelText: "Valor",
                  icon: const Icon(null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: categoryController,
                  labelText: "Categoria",
                  icon: const Icon(null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: dateController,
                  labelText: "Data (dd/MM/yyyy)",
                  icon: const Icon(Icons.date_range),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: commentController,
                  labelText: "Adicione um comentário",
                  icon: const Icon(null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton(
                  titleButton: "Cadastrar",
                  backgroundColor: const Color(0xFF00D09E),
                  color: const Color(0xFF093030),
                  onPressed: () async {
                    await registerExpense();
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