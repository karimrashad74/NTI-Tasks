import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/app_assets.dart';

import '../../../../config/cache/cache_helper.dart';
import '../../data/models/user_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (!formKey.currentState!.validate()) {
      emit(LoginError('Please enter valid data'));
      return;
    }

    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2));

    final username = usernameController.text;
    final password = passwordController.text;

    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_-]+$');
    RegExp passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*()_\-+=\[\]{};:"\\|,.<>\/?]).{6,}$');

    if (usernameRegex.hasMatch(username) && passwordRegex.hasMatch(password)) {
      UserModel user = UserModel(userName: username, image: AppAssets.logo);
      await CacheHelper.set(key: 'isLoggedIn', value: true);
      await CacheHelper.set(key: 'username', value: username);
      emit(LoginSuccess(user));
    } else {
      if (!usernameRegex.hasMatch(username)) {
        emit(LoginError('Invalid username format'));
      } else if (!passwordRegex.hasMatch(password)) {
        emit(LoginError('Invalid password format'));
      }
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
