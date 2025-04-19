import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/components/auth_text_link.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';
import 'package:to_do_app/features/Authentication/components/pass_field.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputFormField(
            startIcon: Icon(Icons.person_outline_rounded),
            hintText: "Username",
          ),
          PassField(
            startIcon: Icon(Icons.key_rounded),
            hintText: "Enter Password",
            endIcon: Icon(Icons.lock_outline_rounded),
            endIconSwitch: Icon(Icons.lock_open_rounded),
          ),
          PrimaryButton(text: "Login"),
          SizedBox(height: 50),
          AuthTextLink(
            firstText: "Don't have an account?",
            secondText: "Register",
            onTap: () {
              Navigator.pushNamed(context, "/signup");
            },
          ),
        ],
      ),
    );
  }
}
