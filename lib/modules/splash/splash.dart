import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extensions.dart';
import '/core/constants/app_assets.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

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
