import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/firestore_service.dart';
import '../widgets/base_page.dart';

class ExpensesViewPage extends StatefulWidget {
  const ExpensesViewPage({super.key});

  @override
  State<ExpensesViewPage> createState() => _ExpensesViewPageState();
}

class _ExpensesViewPageState extends State<ExpensesViewPage> {
  List _allExpenses = [];
  List _filteredExpenses = [];
  String? _selectedCategory;
  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  _loadExpenses() async {
    var expenses = await FirestoreService().getAllExpenses();
    setState(() {
      _allExpenses = expenses;
      _filteredExpenses = expenses;
      _categories = expenses
          .map<String>((expense) => expense['category'] as String)
          .toSet()
          .toList();
    });
  }

  void _filterExpenses() {
    setState(() {
      if (_selectedCategory != null) {
        _filteredExpenses = _allExpenses
            .where((expense) => expense['category'] == _selectedCategory)
            .toList();
      } else {
        _filteredExpenses = _allExpenses;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Despesas',
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: DropdownButtonFormField(
                dropdownColor: const Color(0xFFDFF7E2),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFDFF7E2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFF00D09E),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFF00D09E),
                      width: 2,
                    ),
                  ),
                ),
                value: _selectedCategory,
                hint: const Text('Escolha Uma Opção'),
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                    _filterExpenses();
                  });
                },
                items:
                    _categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: _filteredExpenses.length,
              itemBuilder: (context, index) {
                var expense = _filteredExpenses[index];
                return ListTile(
                  leading: const Icon(Icons.monetization_on,
                      color: Color(0xFF6DB6FE)),
                  title: Text('${expense['title']} \n ${expense['category']}'),
                  subtitle: Text(
                    DateFormat('dd/MM/yyyy hh:mm:ss')
                        .format(expense['date'].toDate()),
                    style: const TextStyle(color: Color(0xFF0068FF)),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'R\$ ${expense['value'].toStringAsFixed(2)}',
                        style: const TextStyle(color: Color(0xFF0068FF)),
                      ),
                      const SizedBox(width: 8),
                      PopupMenuButton(
                        icon: const Icon(Icons.more_vert,
                            color: Color(0xFF00D09E)),
                        onSelected: (String choice) async {
                          // if (choice == 'edit') {
                          //   Map<String, dynamic> expenseData = {
                          //     'id': expense['Document ID'],
                          //     'title': expense['title'],
                          //     'category': expense['category'],
                          //     'date': expense['date'],
                          //     'value': expense['value'],
                          //     'aditional_notes': expense['aditional_notes']
                          //   };
                          //
                          //   await Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => RegisterExpenses(expenseData: expenseData),
                          //       ));
                          // } else if (choice == 'delete') {
                          //   // Chame sua função de exclusão
                          // }
                        },
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Editar'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Excluir'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(color: Color(0xFF00D09E)),
            ),
          ),
        ],
      ),
    );
  }
}
