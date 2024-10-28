import 'package:expenses_control/services/firestore_service.dart';
import 'package:expenses_control/widgets/base_page.dart';
import 'package:expenses_control/widgets/custom_button.dart';
import 'package:expenses_control/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterExpenses extends StatefulWidget {
  RegisterExpenses({super.key});

  @override
  State<RegisterExpenses> createState() => _RegisterExpensesState();
}

class _RegisterExpensesState extends State<RegisterExpenses> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

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
                  icon: const Icon(Icons.date_range),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: valueController,
                  labelText: "Valor",
                  icon: const Icon(Icons.date_range),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: categoryController,
                  labelText: "Categoria",
                  icon: const Icon(Icons.date_range),
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
                  icon: const Icon(Icons.ice_skating),
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
                      DateTime parsedDate = DateFormat("dd/MM/yyyy").parse(dateController.text);
                      await FirestoreService().postRegisterExpense(
                        expenseController.text,
                        double.parse(valueController.text),
                        categoryController.text,
                        parsedDate,
                        commentController.text,
                      );

                      expenseController.clear();
                      valueController.clear();
                      categoryController.clear();
                      dateController.clear();
                      commentController.clear();
                    } catch (e) {
                      print("Erro ao registrar despesa: $e");
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