import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2));

    final username = usernameController.text;
    final password = passwordController.text;

    if (username == 'admin' && password == '123456') {
      emit(LoginSuccess());
    } else {
      emit(LoginError('Invalid username or password'));
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
