import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/localisation/app_strings.dart';
import 'package:to_do_app/features/Authentication/components/auth_text_link.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';
import 'package:to_do_app/features/Authentication/components/pass_field.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_routes.dart';
import '../view_model/login_cubit/login_cubit.dart';
import '../view_model/login_cubit/login_state.dart';
import '../view_model/password_cubit/password_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.validateUsername;
    } else if (value.length < 4) {
      return AppStrings.validateLengthUsername;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.validatePassword;
    } else if (value.length < 6) {
      return AppStrings.validateLengthPassword;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                InputFormField(
                  controller: cubit.usernameController,
                  validator: _validateUserName,
                  startIcon: SvgPicture.asset(AppAssets.profile,
                      width: 24, height: 24),
                  hintText: AppStrings.usernameLabel,
                ),
                PassField(
                  controller: cubit.passwordController,
                  validator: _validatePassword,
                  startIcon: SvgPicture.asset(AppAssets.password,
                      width: 24, height: 24),
                  hintText: AppStrings.passwordHint,
                  endIcon:
                      SvgPicture.asset(AppAssets.lock, width: 24, height: 24),
                  endIconSwitch:
                      SvgPicture.asset(AppAssets.unLock, width: 24, height: 24),
                ),
                PrimaryButton(
                  text: AppStrings.loginButton,
                  isLoading: state is LoginLoading,
                  onPressed: state is LoginLoading ? null : () => cubit.login(),
                ),
                SizedBox(height: 50),
                AuthTextLink(
                  firstText: AppStrings.dontHaveAccountText,
                  secondText: AppStrings.registerButton,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
