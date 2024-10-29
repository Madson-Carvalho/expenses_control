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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF00D09E), // Cor do cabeçalho
            cardColor: Color(0xFF00D09E),
            colorScheme: ColorScheme.light(primary: Color(0xFF00D09E)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateController.text = DateFormat("dd/MM/yyyy").format(picked);
      });
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: valueController,
                  labelText: "Valor",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: categoryController,
                  labelText: "Categoria",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: CustomInput(
                      controller: dateController,
                      labelText: "Data",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomInput(
                  controller: commentController,
                  labelText: "Adicione um comentário",
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
