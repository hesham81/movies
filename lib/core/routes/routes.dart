import 'package:flutter/material.dart';
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
      default:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
          settings: setting,
        );
    }
  }
}
