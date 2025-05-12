import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../home/view_model/user_cubit/user_cubit.dart';
import '../view_model/login_cubit/login_cubit.dart';
import '../view_model/login_cubit/login_state.dart';
import 'components/auth_logo.dart';
import 'components/login_form.dart';

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
                    UserCubit.get(context).getUser(state.userModel);
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  } else if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
