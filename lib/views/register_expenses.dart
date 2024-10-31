import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_control/services/firestore_service.dart';
import 'package:expenses_control/widgets/base_page.dart';
import 'package:expenses_control/widgets/custom_button.dart';
import 'package:expenses_control/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterExpenses extends StatefulWidget {
  final Map<String, dynamic>? expenseData;

  const RegisterExpenses({super.key, this.expenseData});

  @override
  State<RegisterExpenses> createState() => _RegisterExpensesState();
}

class _RegisterExpensesState extends State<RegisterExpenses> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  late bool isEditing;

  @override
  void initState() {
    super.initState();
    isEditing = widget.expenseData != null;

    if (isEditing) {
      expenseController.text = widget.expenseData!['title'];
      valueController.text = widget.expenseData!['value'];
      categoryController.text = widget.expenseData!['category'];
      DateTime dateTime = (widget.expenseData!['date'] as Timestamp).toDate();
      dateController.text = DateFormat("dd/MM/yyyy").format(dateTime);
      commentController.text = widget.expenseData!['aditional_notes'];
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF00D09E),
            cardColor: const Color(0xFF00D09E),
            colorScheme: const ColorScheme.light(primary: Color(0xFF00D09E)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
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

  void _onSubmit() async {
    try {
      DateTime parsedDate = DateFormat("dd/MM/yyyy").parse(dateController.text);
      if (isEditing) {
        await FirestoreService().putRegisterExpense(
          widget.expenseData!['id'],
          expenseController.text,
          double.parse(valueController.text),
          categoryController.text,
          parsedDate,
          commentController.text,
        );
      } else {
        await FirestoreService().postRegisterExpense(
          expenseController.text,
          double.parse(valueController.text),
          categoryController.text,
          parsedDate,
          commentController.text,
        );
      }

      expenseController.clear();
      valueController.clear();
      categoryController.clear();
      dateController.clear();
      commentController.clear();

      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      print("Erro ao registrar ou editar despesa: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: isEditing ? 'Edição de Despesa' : 'Cadastro de Despesas',
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
                  titleButton: isEditing ? "Atualizar" : "Cadastrar",
                  backgroundColor: const Color(0xFF00D09E),
                  color: const Color(0xFF093030),
                  onPressed: _onSubmit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
