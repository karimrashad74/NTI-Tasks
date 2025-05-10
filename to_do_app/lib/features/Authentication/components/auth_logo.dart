import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_assets.dart';

import '../../../core/utils/app_colors.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.367,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        image: DecorationImage(
          image: AssetImage(AppAssets.logo),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
