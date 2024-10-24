import 'package:expenses_control/services/auth_service.dart';
import 'package:expenses_control/widgets/base_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';

  @override
  void initState() {
    super.initState();

    _loadUserName();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Olá, $userName!',
      body: Column(),
    );
  }

  Future<void> _loadUserName() async {
    String name = await FirebaseAuthService().checkUser();

    setState(() {
      userName = name;
    });
  }
}
