import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';
import 'package:to_do_app/core/localisation/app_strings.dart';

import '../../../core/utils/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRoutes.startScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.splachScreenLogo,
            width: MediaQuery.of(context).size.width * 0.8906,
            height: MediaQuery.of(context).size.height * 0.423,
          ),
          const SizedBox(
            height: 20,
          ),
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
      )),
    );
  }
}
