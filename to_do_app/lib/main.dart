import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/views/login_view.dart';
import 'package:to_do_app/features/Authentication/views/signup_view.dart';
import 'package:to_do_app/features/splash_screen/view/splash_view.dart';
import 'package:to_do_app/features/start_screen/view/start_view.dart';
import 'package:to_do_app/features/home/views/home_view.dart';
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
        AppRoutes.splachScreen: (context) => const SplashView(),
        AppRoutes.startScreen: (context) => const StartView(),
        AppRoutes.login: (context) => LoginView(),
        AppRoutes.signUp: (context) => SignupView(),
        AppRoutes.home: (context) => HomeView(),
      },
    );
  }
}
