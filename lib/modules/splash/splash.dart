import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extensions.dart';
import 'package:movies/core/routes/route_names.dart';
import '/core/constants/app_assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.login,
        (_) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          0.4.horSpace(),
          Image.asset(
            AppAssets.logo,
          ).center,
          Spacer(),
          SafeArea(
            child: Image.asset(
              AppAssets.brand,
            ),
          ),
        ],
      ),
    );
  }
}
