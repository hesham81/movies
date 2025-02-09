import 'package:flutter/material.dart';
import 'package:movies/core/routes/route_names.dart';

import '../../modules/splash/splash.dart';

abstract class Routes {
  static Route onGenerateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
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
