import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/authentication/components/auth_logo.dart';

import '../components/signup_form.dart';
import '../view_model/signup_cubit/signup_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: const [
                AuthLogo(),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
