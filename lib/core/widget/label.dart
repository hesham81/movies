import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class Label extends StatelessWidget {
  final String text;

  final TextStyle? style;

  const Label({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
    );
  }
}
