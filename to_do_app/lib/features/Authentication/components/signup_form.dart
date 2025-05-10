import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/localisation/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_routes.dart';
import '../view_model/password_cubit/password_cubit.dart';
import 'auth_text_link.dart';
import 'input_form_field.dart';
import 'pass_field.dart';
import 'primary_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupFormKey = GlobalKey<FormState>();

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: Form(
        key: signupFormKey,
        child: Column(
          children: [
            InputFormField(
              controller: usernameController,
              startIcon:
                  SvgPicture.asset(AppAssets.profile, width: 24, height: 24),
              hintText: AppStrings.usernameLabel,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.requiredUserName;
                }
                return null;
              },
            ),
            PassField(
              controller: passwordController,
              startIcon:
                  SvgPicture.asset(AppAssets.lock, width: 24, height: 24),
              hintText: AppStrings.passwordHint,
              endIcon:
                  SvgPicture.asset(AppAssets.unLock, width: 24, height: 24),
              endIconSwitch: Icon(Icons.visibility),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.requiredPassword;
                }
                if (value.length < 6) {
                  return AppStrings.validateLengthPassword;
                }
                return null;
              },
            ),
            PassField(
              controller: confirmPasswordController,
              startIcon:
                  SvgPicture.asset(AppAssets.lock, width: 24, height: 24),
              hintText: AppStrings.confirmPasswordHint,
              endIcon:
                  SvgPicture.asset(AppAssets.unLock, width: 24, height: 24),
              endIconSwitch:
                  SvgPicture.asset(AppAssets.lock, width: 24, height: 24),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.confirmPasswordHint;
                }
                if (value != passwordController.text) {
                  return AppStrings.matchPassword;
                }
                return null;
              },
            ),
            PrimaryButton(
              text: AppStrings.signUpButton,
              isLoading: true,
              onPressed: () {
                if (signupFormKey.currentState!.validate()) {
                  Navigator.pushNamed(context, AppRoutes.home);
                }
              },
            ),
            AuthTextLink(
              firstText: AppStrings.alreadyHaveAccountText,
              secondText: AppStrings.loginButton,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
