import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';

class primaryColorButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;

  const primaryColorButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool shouldDisable = isDisabled || isLoading;

    return ElevatedButton(
      onPressed: shouldDisable ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shadowColor: AppColors.primaryColor,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: Size(
          MediaQuery.of(context).size.width * 0.88,
          MediaQuery.of(context).size.height * 0.0591,
        ),
      ),
      child: isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 2.5,
              ),
            )
          : Text(
              "$text",
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 19,
                fontFamily: AppConstants.fontFamily,
                fontWeight: FontWeight.w300,
              ),
            ),
    );
  }
}
