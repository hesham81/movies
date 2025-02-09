import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies/core/routes/routes.dart';
import '/core/theme/app_theme.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      builder: EasyLoading.init(
        builder: EasyLoading.init(
          builder: BotToastInit(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}
