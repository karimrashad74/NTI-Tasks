import 'package:flutter/material.dart';

class InputFormField extends StatefulWidget {
  final Widget? startIcon;
  final String? hintText;

  const InputFormField({
    super.key,
    required this.startIcon,
    required this.hintText,
  });

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  @override
  Widget build(BuildContext context) {
    return decorationInputField(
        context: context,
        startIcon: widget.startIcon!,
        hintText: widget.hintText!);
  }
}

Widget decorationInputField({
  required BuildContext context,
  required Widget startIcon,
  required String hintText,
  bool obscureText = false,
  Widget? suffixIcon,
  VoidCallback? onSuffixIconPressed,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    height: MediaQuery.of(context).size.height * 0.0775,
    width: MediaQuery.of(context).size.width * 0.88,
    child: TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      obscureText: obscureText,
      cursorColor: const Color.fromARGB(255, 20, 153, 84),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: startIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w200,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: onSuffixIconPressed, icon: suffixIcon)
            : null,
        border: decorationBorder(const Color.fromARGB(255, 205, 205, 205)),
        focusedBorder: decorationBorder(const Color.fromARGB(255, 20, 153, 84)),
        errorBorder: decorationBorder(Colors.red),
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
