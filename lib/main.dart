import 'package:expenses_control/views/home_page.dart';
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
      initialRoute: '/register-user',
      routes: {
        '/': (context) => const HomePage(),
        '/register-user': (context) => RegisterUser(),
      },
    ),
  );
}
