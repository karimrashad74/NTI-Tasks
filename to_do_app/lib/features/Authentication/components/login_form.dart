import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/features/Authentication/components/auth_text_link.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';
import 'package:to_do_app/features/Authentication/components/pass_field.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';
import 'package:to_do_app/utils/app_text.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_routes.dart';

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
            startIcon: SvgPicture.asset(AppAssets.profile),
            hintText: AppText.userName,
          ),
          PassField(
            startIcon: SvgPicture.asset(AppAssets.password),
            hintText: AppText.password,
            endIcon: SvgPicture.asset(AppAssets.lock),
            endIconSwitch: SvgPicture.asset(AppAssets.unLock),
          ),
          PrimaryButton(
            text: AppText.login,
          ),
          SizedBox(height: 50),
          AuthTextLink(
            firstText: AppText.notHaveAccount,
            secondText: AppText.register,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.signUp);
            },
          ),
        ],
      ),
    );
  }
}
