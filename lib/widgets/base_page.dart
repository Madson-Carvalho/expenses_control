import 'package:expenses_control/services/auth_service.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final String title;
  final Widget body;

  const BasePage({super.key, required this.body, required this.title});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();

    _loadUserName();
    _loadUserEmail();
  }

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
        child: ListView(padding: EdgeInsets.zero, children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountEmail: Text(userEmail,
                style: const TextStyle(color: Colors.black)),
            accountName: Text(
              userName,
              style: const TextStyle(fontSize: 24.0, color: Colors.black),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF00D09E),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/register-expense');
            },
            child: const ListTile(
              leading: Icon(Icons.add),
              title: Text(
                'Cadastrar despesas',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/expense-view');
            },
            child: const ListTile(
              leading: Icon(Icons.money_off),
              title: Text(
                'Despesas',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuthService().logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const ListTile(
              leading: Icon(Icons.output),
              title: Text(
                'Sair',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ]),
      ),
      body: widget.body,
    );
  }

  Future<void> _loadUserName() async {
    String name = await FirebaseAuthService().checkUser();

    setState(() {
      userName = name;
    });
  }

  Future<void> _loadUserEmail() async {
    String email = await FirebaseAuthService().checkEmail();

    setState(() {
      userEmail = email;
    });
  }
}
