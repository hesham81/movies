import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extensions.dart';
import 'package:movies/core/theme/app_colors.dart';

class TabItems extends StatelessWidget {
  final IconData icon;

  final String text;

  const TabItems({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.secondaryColor,
        ),
        0.01.horSpace(),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
        ),
      ],
    );
  }
}
