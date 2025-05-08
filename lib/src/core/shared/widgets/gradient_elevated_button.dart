import 'package:flutter/material.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double height;
  final VoidCallback onPressed;
  final double? borderRadius;

  const GradientButton(
      {super.key,
      this.width,
      this.height = 50,
      required this.onPressed,
      this.borderRadius,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(
              borderRadius ?? AppConstants.primaryRadius)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            hoverColor: Colors.red,
            onTap: onPressed,
            borderRadius: BorderRadius.circular(
                borderRadius ?? AppConstants.primaryRadius),
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
