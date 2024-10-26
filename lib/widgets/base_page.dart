import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final String title;
  final Widget body;

  const BasePage({super.key, required this.body, required this.title});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FFF3),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Color(0xFF093030), fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF00D09E),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: const [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountEmail: Text('khalifa@example.com', style: TextStyle(color: Colors.black)),
            accountName: Text(
              'Khalifa do Brega',
              style: TextStyle(fontSize: 24.0, color: Colors.black),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF00D09E),
                ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Cadastrar despesas',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text(
              'Despesas',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.output),
            title: Text(
              'Sair',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ]),
      ),
      body: widget.body,
    );
  }
}
