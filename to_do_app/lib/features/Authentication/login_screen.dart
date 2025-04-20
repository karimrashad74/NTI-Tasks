import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/components/auth_logo.dart';
import 'package:to_do_app/features/Authentication/components/login_form.dart';
import 'package:to_do_app/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [AuthLogo(), LoginForm()],
          ),
        ),
      ),
    );
  }
}
