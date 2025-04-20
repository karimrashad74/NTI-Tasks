import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/login_screen.dart';
import 'package:to_do_app/features/Authentication/signup_screen.dart';
import 'package:to_do_app/features/splash_screen/splash_screen.dart';
import 'package:to_do_app/home_screen.dart';
import 'package:to_do_app/utils/app_routes.dart';

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
      initialRoute: AppRoutes.splachScreen,
      routes: {
        AppRoutes.splachScreen: (context) => const SplashScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.signUp: (context) => SignupScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}
