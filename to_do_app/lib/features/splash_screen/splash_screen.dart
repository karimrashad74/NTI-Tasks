import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/utils/app_assets.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_constants.dart';
import 'package:to_do_app/utils/app_text.dart';

import '../../utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
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
          const Text(
            AppText.todo,
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
