import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/components/auth_text_link.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';
import 'package:to_do_app/features/Authentication/components/pass_field.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
          PassField(
            startIcon: Icon(Icons.key_rounded),
            hintText: "Confirm Password",
            endIcon: Icon(Icons.lock_outline_rounded),
            endIconSwitch: Icon(Icons.lock_open_rounded),
          ),
          PrimaryButton(text: "Login"),
          SizedBox(height: 50),
          AuthTextLink(
            firstText: "Already Have An Account?",
            secondText: "Login",
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}
