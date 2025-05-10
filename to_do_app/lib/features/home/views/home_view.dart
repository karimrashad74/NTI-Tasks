import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/localisation/app_strings.dart';
import 'package:to_do_app/features/home/view_model/user_cubit/user_state.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paddings.dart';
import '../../../core/widgets/custom_svg.dart';
import '../view_model/user_cubit/user_cubit.dart';
import '../widgets/task_item_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.viewPadding,
          child: ListView(
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 16),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grey,
                            image: DecorationImage(
                                image: AssetImage(AppAssets.logo),
                                fit: BoxFit.cover)),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.hello,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: AppColors.black),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            if (state is UserGetSuccess)
                              Text(
                                state.userModel.userName ?? "",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.black),
                              ),
                            // Text(
                            //   "Karim Rashad",
                            //   maxLines: 1,
                            //   style: TextStyle(
                            //       overflow: TextOverflow.ellipsis,
                            //       fontWeight: FontWeight.w300,
                            //       fontSize: 16,
                            //       color: AppColors.black),
                            // ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: CustomSvg(path: AppAssets.addIcon))
                    ],
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return TaskItemBuilder();
                  },
                  separatorBuilder: (context, int index) => SizedBox(
                        height: 5,
                      ),
                  itemCount: 6),
            ],
          ),
        ),
      ),
    );
  }
}
