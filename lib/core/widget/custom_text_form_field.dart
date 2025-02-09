import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final double? borderRadius;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final bool isPassword;
  final TextEditingController controller;
  final bool isFilled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Validator? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.borderRadius,
    this.hintStyle,
    this.borderColor,
    this.isPassword = false,
    required this.controller,
    this.isFilled = false,
    this.fillColor,
    this.prefixIcon,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.whiteColor,
          ),
      validator: widget.validator,
      controller: widget.controller,
      obscureText: (widget.isPassword) ? !visible : false,
      obscuringCharacter: "*",
      cursorColor: AppColors.whiteColor,
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
          filled: widget.isFilled,
          fillColor: widget.fillColor ?? AppColors.secondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: BorderSide(
              color: widget.borderColor ??
                  AppColors.secondaryColor.withOpacity(0.7),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: BorderSide(
              color: widget.borderColor ??
                  AppColors.secondaryColor.withOpacity(0.7),
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.red.withOpacity(0.7),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: BorderSide(
              color: widget.borderColor ??
                  AppColors.secondaryColor.withOpacity(0.7),
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: BorderSide(
              color: widget.borderColor ??
                  AppColors.secondaryColor.withOpacity(0.7),
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.7),
              width: 1.5,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontFamily: "Poppins",
              ),
          suffixIcon: (widget.isPassword == true)
              ? (visible)
                  ? IconButton(
                      onPressed: () {
                        visible = !visible;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.visibility_outlined,
                        color: AppColors.whiteColor,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        visible = !visible;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.whiteColor,
                      ),
                    )
              : null,
          prefixIcon: widget.prefixIcon),
    );
  }
}
