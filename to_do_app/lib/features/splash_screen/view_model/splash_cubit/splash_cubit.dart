import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/cache/cache_helper.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  void startSplashFlow(BuildContext context) async {
    emit(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 3));

    bool? isLoggedIn = CacheHelper.getBool(key: 'isLoggedIn');

    if (isLoggedIn == true) {
      emit(SplashNavigateToHome());
    } else {
      bool? isStartViewShown = CacheHelper.getBool(key: 'start_view_shown');
      if (isStartViewShown == true) {
        emit(SplashNavigateToLogin());
      } else {
        await CacheHelper.set(key: 'start_view_shown', value: true);
        emit(SplashNavigateToStart());
      }
    }
  }
}
