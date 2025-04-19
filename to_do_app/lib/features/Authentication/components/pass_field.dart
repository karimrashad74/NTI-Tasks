import 'package:flutter/material.dart';
import 'package:to_do_app/features/Authentication/components/input_form_field.dart';

class PassField extends StatefulWidget {
  final Widget? startIcon;
  final Icon endIcon;
  final Icon endIconSwitch;
  final String? hintText;

  const PassField({
    super.key,
    required this.startIcon,
    required this.hintText,
    required this.endIcon,
    required this.endIconSwitch,
  });

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return decorationInputField(
      context: context,
      startIcon: widget.startIcon!,
      hintText: widget.hintText!,
      obscureText: _obscure,
      suffixIcon:
          Icon(_obscure ? widget.endIcon.icon : widget.endIconSwitch.icon),
      onSuffixIconPressed: () {
        setState(() {
          _obscure = !_obscure;
        });
      },
    );
  }
}
