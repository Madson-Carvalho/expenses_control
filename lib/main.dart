import 'package:expenses_control/views/expenses_view_page.dart';
import 'package:expenses_control/views/home_page.dart';
import 'package:expenses_control/views/login_page.dart';
import 'package:expenses_control/views/register_expenses.dart';
import 'package:expenses_control/views/register_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/register-user': (context) => RegisterUser(),
        '/register-expense': (context) => RegisterExpenses(),
        '/expense-view': (context) => const ExpensesViewPage(),
      },
    ),
  );
}
