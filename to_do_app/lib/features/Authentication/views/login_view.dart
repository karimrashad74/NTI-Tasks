import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_routes.dart';
import 'package:to_do_app/features/Authentication/components/auth_logo.dart';
import 'package:to_do_app/features/Authentication/components/login_form.dart';
import 'package:to_do_app/features/Authentication/view_model/login_cubit/login_state.dart';

import '../view_model/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthLogo(),
                BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
                  return LoginForm();
                }, listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushNamed(context, AppRoutes.home);
                  } else if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
