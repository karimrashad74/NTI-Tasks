import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/localisation/app_strings.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';

import '../../../core/utils/app_routes.dart';
import '../view_model/splash_cubit/splash_cubit.dart';
import '../view_model/splash_cubit/splash_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..startSplashFlow(context),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashNavigateToHome) {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            } else if (state is SplashNavigateToLogin) {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            } else if (state is SplashNavigateToStart) {
              Navigator.pushReplacementNamed(context, AppRoutes.startScreen);
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.splachScreenLogo,
                  width: MediaQuery.of(context).size.width * 0.8906,
                  height: MediaQuery.of(context).size.height * 0.423,
                ),
                const SizedBox(height: 20),
                Text(
                  AppStrings.todoTitle,
                  style: TextStyle(
                    fontSize: 36,
                    color: AppColors.primary,
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
