import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';
import 'package:to_do_app/core/utils/app_routes.dart';
import 'package:to_do_app/core/localisation/app_strings.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.letsStartPic,
              width: MediaQuery.of(context).size.width * 0.804,
              height: MediaQuery.of(context).size.height * 0.422,
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.welcomeTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: AppConstants.fontFamily,
                color: AppColors.lighBlack,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              AppStrings.welcomeSubtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.fontFamily,
                color: AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
                text: AppStrings.letsStartButton,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                }),
          ],
        ),
      ),
    );
  }
}
