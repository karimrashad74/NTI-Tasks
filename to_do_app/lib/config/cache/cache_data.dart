import '../../features/Authentication/data/models/user_model.dart';

abstract class CacheData {
  static bool? firstTime;
  static UserModel? userModel;
  static bool? loggedIn;
  static String? accessToken;
  static String? refreshToken;
}
