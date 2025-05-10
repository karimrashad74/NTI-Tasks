import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/localisation/app_strings.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';
import 'package:to_do_app/core/utils/app_routes.dart';
import 'package:to_do_app/features/Authentication/components/primary_button.dart';

import '../../../config/cache/cache_helper.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  bool isSubmitting = false;

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
              isLoading: isSubmitting,
              isDisabled: false,
              onPressed: () async {
                setState(() => isSubmitting = true);
                await CacheHelper.set(key: 'start_view_shown', value: true);
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
