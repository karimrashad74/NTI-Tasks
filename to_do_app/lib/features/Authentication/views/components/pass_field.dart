import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/Authentication/views/components/input_form_field.dart';

import '../../view_model/password_cubit/password_cubit.dart';

class PassField extends StatelessWidget {
  final Widget? startIcon;
  final Widget endIcon;
  final Widget endIconSwitch;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const PassField({
    super.key,
    required this.startIcon,
    required this.hintText,
    required this.endIcon,
    required this.endIconSwitch,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, bool>(
      builder: (context, obscure) {
        return decorationInputField(
          context: context,
          controller: controller,
          validator: validator,
          startIcon: startIcon!,
          hintText: hintText!,
          obscureText: obscure,
          suffixIcon: obscure ? endIcon : endIconSwitch,
          onSuffixIconPressed: () {
            context.read<PasswordCubit>().togglePasswordVisibility();
          },
        );
      },
    );
  }
}
