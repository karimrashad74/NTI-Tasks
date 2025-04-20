// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/features/Authentication/components/auth_text_link.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';
import 'package:to_do_app/features/Authentication/components/pass_field.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';
import 'package:to_do_app/utils/app_routes.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_text.dart';

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
            startIcon: SvgPicture.asset(AppAssets.profile),
            hintText: AppText.userName,
          ),
          PassField(
            startIcon: SvgPicture.asset(AppAssets.password),
            hintText: AppText.password,
            endIcon: SvgPicture.asset(AppAssets.lock),
            endIconSwitch: SvgPicture.asset(AppAssets.unLock),
          ),
          PassField(
            startIcon: SvgPicture.asset(AppAssets.password),
            hintText: AppText.confirmPassword,
            endIcon: SvgPicture.asset(AppAssets.lock),
            endIconSwitch: SvgPicture.asset(AppAssets.unLock),
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

          PrimaryButton(text: AppText.signUp),
          // SizedBox(height: 10),
          AuthTextLink(
            firstText: AppText.alreadyHaveAccount,
            secondText: AppText.login,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
