import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/features/Authentication/components/auth_text_link.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';
import 'package:to_do_app/features/Authentication/components/pass_field.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';
import 'package:to_do_app/core/utils/app_text.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_routes.dart';

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
            startIcon: SvgPicture.asset(
              AppAssets.profile,
              width: 24,
              height: 24,
            ),
            hintText: AppText.usernameLabel,
          ),
          PassField(
            startIcon: SvgPicture.asset(
              AppAssets.password,
              width: 24,
              height: 24,
            ),
            hintText: AppText.passwordHint,
            endIcon: SvgPicture.asset(
              AppAssets.lock,
              width: 24,
              height: 24,
            ),
            endIconSwitch: SvgPicture.asset(
              AppAssets.unLock,
              width: 24,
              height: 24,
            ),
          ),
          PrimaryButton(
            text: AppText.loginButton,
            onPressed: () {},
          ),
          SizedBox(height: 50),
          AuthTextLink(
            firstText: AppText.dontHaveAccountText,
            secondText: AppText.registerButton,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.signUp);
            },
          ),
        ],
      ),
    );
  }
}
