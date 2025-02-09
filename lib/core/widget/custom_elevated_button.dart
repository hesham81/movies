import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;

  final Color? bgColor;

  final Function()? callBack;

  final double? borderRadius;

  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.bgColor,
    this.callBack,
    this.borderRadius = 100,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callBack ?? (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
      ),
    );
  }
}
