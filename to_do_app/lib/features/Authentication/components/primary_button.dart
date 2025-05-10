import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';

class PrimaryButton extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.text, this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        "${widget.text}",
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 19,
          fontFamily: AppConstants.fontFamily,
          fontWeight: FontWeight.w300,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.primary,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: Size(
          MediaQuery.of(context).size.width * 0.88,
          MediaQuery.of(context).size.height * 0.0591133004926108,
        ),
      ),
    );
  }
}
