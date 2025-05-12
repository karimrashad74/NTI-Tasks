import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/config/cache/cache_helper.dart';
import 'package:to_do_app/core/utils/app_routes.dart';
import 'package:to_do_app/features/Authentication/views/login_view.dart';
import 'package:to_do_app/features/Authentication/views/signup_view.dart';
import 'package:to_do_app/features/home/views/home_view.dart';
import 'package:to_do_app/features/splash_screen/view/splash_view.dart';
import 'package:to_do_app/features/start_screen/view/start_view.dart';

import 'features/Authentication/view_model/login_cubit/login_cubit.dart';
import 'features/home/view_model/user_cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => UserCubit()),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splachScreen,
        routes: {
          AppRoutes.splachScreen: (context) => const SplashView(),
          AppRoutes.startScreen: (context) => const StartView(),
          AppRoutes.login: (context) => const LoginView(),
          AppRoutes.signUp: (context) => const SignupView(),
          AppRoutes.home: (context) => const HomeView(),
        },
      ),
    );
  }
}
