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
  List<dynamic> _allExpenses = [];
  List<dynamic> _filteredExpenses = [];
  String? _selectedCategory;
  final List<String> _categories = [ 'Categoria', 'Valor', 'Data' ];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    var expenses = await FirestoreService().getAllExpenses();
    setState(() {
      _allExpenses = expenses;
      _filteredExpenses = expenses; // Exibe todas as despesas no início
    });
  }

  void _filterExpenses() {
    setState(() {
      if (_selectedCategory == null || _selectedCategory == 'Todos') {
        _filteredExpenses = _allExpenses;
      } else {
        _filteredExpenses = _allExpenses
            .where((expense) => expense['category'] == _selectedCategory)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Despesas',
      body: Column(
        children: [
          // Dropdown para seleção de categoria
          Container(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: DropdownButtonFormField<String>(
                dropdownColor: Color(0xFFDFF7E2),
                decoration:
                InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFDFF7E2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                    enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFF00D09E), // Cor da borda quando o campo está habilitado
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xFF00D09E), // Cor da borda quando o campo está em foco
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
                items: _categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Lista de despesas filtradas
          Expanded(
            child: ListView.separated(
              itemCount: _filteredExpenses.length,
              itemBuilder: (context, index) {
                var expense = _filteredExpenses[index];
                return ListTile(
                  leading: const Icon(Icons.monetization_on, color: Color(0xFF6DB6FE)),
                  title: Text('${expense['title']} \n ${expense['category']}'),
                  subtitle: Text(
                    DateFormat('dd/MM/yyyy hh:mm:ss').format(expense['date'].toDate()),
                    style: const TextStyle(color: Color(0xFF0068FF)),
                  ),
                  trailing: Text(
                    '- R\$ ${expense['value'].toStringAsFixed(2)}',
                    style: const TextStyle(color: Color(0xFF0068FF)),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(color: Color(0xFF00D09E)),
            ),
          ),
        ],
      ),
    );
  }
}
