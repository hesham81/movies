import 'package:flutter/material.dart';
import 'package:movies/core/routes/routes.dart';
import '/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

var navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}
