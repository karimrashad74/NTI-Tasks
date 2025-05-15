import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_constants.dart';

class InputFormField extends StatelessWidget {
  final Widget? startIcon;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const InputFormField({
    super.key,
    required this.startIcon,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return decorationInputField(
      context: context,
      controller: controller,
      validator: validator,
      startIcon: startIcon!,
      hintText: hintText!,
    );
  }
}

Widget decorationInputField({
  required BuildContext context,
  required Widget startIcon,
  required String hintText,
  required TextEditingController controller,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
  Widget? suffixIcon,
  VoidCallback? onSuffixIconPressed,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    height: MediaQuery.of(context).size.height * 0.0775,
    width: MediaQuery.of(context).size.width * 0.88,
    child: TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w400,
      ),
      obscureText: obscureText,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: startIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.grey,
          fontSize: 14,
          fontFamily: AppConstants.fontFamily,
          fontWeight: FontWeight.w200,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: onSuffixIconPressed, icon: suffixIcon)
            : null,
        border: decorationBorder(AppColors.lightGrey),
        focusedBorder: decorationBorder(AppColors.primaryColor),
        errorBorder: decorationBorder(AppColors.errorColor),
      ),
    ),
  );
}

InputBorder decorationBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: color,
      width: 1,
    ),
  );
}
