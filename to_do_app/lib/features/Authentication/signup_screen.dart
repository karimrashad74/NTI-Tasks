import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/components/auth_logo.dart';
import 'package:to_do_app/features/Authentication/components/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 244),
      body: SafeArea(
        child: Column(
          children: [AuthLogo(), SignupForm()],
        ),
      ),
    );
  }
}
