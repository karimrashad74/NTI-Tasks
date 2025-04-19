import 'package:flutter/material.dart';

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
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            overlayColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: onTap,
          child: Text(
            secondText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
