import 'package:expenses_control/services/auth_service.dart';
import 'package:expenses_control/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/firestore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';
  double totalExpenses = 0.0;

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadTotalExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Olá, $userName!',
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 100),
              child: Column(
                children: [
                  const Text(
                    "Total Gasto Mensal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 125,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D09E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_circle_down, size: 15),
                            SizedBox(width: 10),
                            Text('Despesa total'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'R\$ ${totalExpenses.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Text(
              "Últimas Despesas",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 50),
            FutureBuilder<dynamic>(
              future: FirestoreService().getLastExpenses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text("Erro ao carregar as despesas"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text("Nenhuma despesa encontrada"));
                } else {
                  var recentExpenses = snapshot.data!;

                  return SizedBox(
                    height: 400,
                    child: ListView.separated(
                      itemCount: recentExpenses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          iconColor: const Color(0xFF6DB6FE),
                          leading: const Icon(Icons.monetization_on),
                          title: Text(
                              '${recentExpenses[index]['title']} \n ${recentExpenses[index]['category']}'),
                          subtitle: Text(
                            DateFormat('dd/MM/yyyy hh:mm:ss')
                                .format(recentExpenses[index]['date'].toDate()),
                            style: const TextStyle(color: Color(0xFF0068FF)),
                          ),
                          trailing: Text(
                            '- R\$ ${recentExpenses[index]['value'].toStringAsFixed(2)}',
                            style: const TextStyle(color: Color(0xFF0068FF)),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: Color(0xFF00D09E)),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadUserName() async {
    String name = await FirebaseAuthService().checkUser();

    setState(() {
      userName = name;
    });
  }

  Future<void> _loadTotalExpenses() async {
    double total = await FirestoreService().getTotalExpenses();

    setState(() {
      totalExpenses = total;
    });
  }
}
