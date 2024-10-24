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
        child: ListView(children: [DrawerHeader(child: child)],),
      ),
      body: widget.body,
    );
  }
}
