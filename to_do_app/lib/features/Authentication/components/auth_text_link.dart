import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';

class AuthTextLink extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onTap;

  const AuthTextLink(
      {super.key,
      required this.onTap,
      required this.firstText,
      required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            overlayColor: AppColors.transparent,
            elevation: 0,
          ),
          onPressed: onTap,
          child: Text(
            secondText,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontFamily: AppConstants.fontFamily,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
