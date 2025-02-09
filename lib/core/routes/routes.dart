import 'package:flutter/material.dart';
import '/modules/layout/pages/home/home.dart';
import '/modules/forget_password/forget_password.dart';
import '/modules/create_account/create_account.dart';
import '/core/routes/route_names.dart';
import '/modules/login/login.dart';

import '../../modules/splash/splash.dart';

abstract class Routes {
  static Route onGenerateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
          settings: setting,
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
          settings: setting,
        );
      case RouteNames.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
          settings: setting,
        );
      case RouteNames.createAccount:
        return MaterialPageRoute(
          builder: (context) => const CreateAccount(),
          settings: setting,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
          settings: setting,
        );
    }
  }
}
