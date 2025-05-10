import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/views/login_screen.dart';
import 'package:to_do_app/features/Authentication/views/signup_screen.dart';
import 'package:to_do_app/features/splash_screen/splash_screen.dart';
import 'package:to_do_app/features/start_screen/start_screen.dart';
import 'package:to_do_app/features/home/views/home_screen.dart';
import 'package:to_do_app/core/utils/app_routes.dart';

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
        AppRoutes.startScreen: (context) => const StartScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.signUp: (context) => SignupScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}
