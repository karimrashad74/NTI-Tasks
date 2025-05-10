// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/features/Authentication/components/auth_text_link.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';
import 'package:to_do_app/features/Authentication/components/pass_field.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';
import 'package:to_do_app/core/utils/app_routes.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_text.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputFormField(
            startIcon:
                SvgPicture.asset(AppAssets.profile, width: 24, height: 24),
            hintText: AppText.usernameLabel,
          ),
          PassField(
            startIcon:
                SvgPicture.asset(AppAssets.password, width: 24, height: 24),
            hintText: AppText.passwordHint,
            endIcon: SvgPicture.asset(AppAssets.lock, width: 24, height: 24),
            endIconSwitch:
                SvgPicture.asset(AppAssets.unLock, width: 24, height: 24),
          ),
          PassField(
            startIcon:
                SvgPicture.asset(AppAssets.password, width: 24, height: 24),
            hintText: AppText.confirmPasswordHint,
            endIcon: SvgPicture.asset(AppAssets.lock, width: 24, height: 24),
            endIconSwitch:
                SvgPicture.asset(AppAssets.unLock, width: 24, height: 24),
          ),

          // DropdownButtonFormField(items: [
          //   DropdownMenuItem(
          //     child: Text('Male'),
          //     value: 0,
          //   ),
          //   DropdownMenuItem(
          //     child: Text('Female'),
          //     value: 1,
          //   ),
          // ], onChanged: (value) {}),

          PrimaryButton(
            text: AppText.signUpButton,
            onPressed: () {},
          ),
          // SizedBox(height: 10),
          AuthTextLink(
            firstText: AppText.alreadyHaveAccountText,
            secondText: AppText.loginButton,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
