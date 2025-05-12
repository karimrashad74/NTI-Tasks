import '../../data/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  UserModel userModel;
  LoginSuccess(this.userModel);
}

class LoginError extends LoginState {
  final String error;

  LoginError(this.error);

  @override
  String toString() => 'LoginError: $error';
}
