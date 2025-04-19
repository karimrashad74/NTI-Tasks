import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/home_screen.dart';
import 'package:to_do_app/features/Authentication/login_screen.dart';
import 'package:to_do_app/features/Authentication/signup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
