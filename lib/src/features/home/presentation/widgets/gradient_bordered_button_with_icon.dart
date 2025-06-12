import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ovida/src/core/constants/app_colors.dart';

class BorderedButtonWithIcon extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  const BorderedButtonWithIcon({
    required this.height,
    required this.width,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: AppColors.primaryGradient,
              width: 1.sp,
            ),
            borderRadius: BorderRadius.circular(50.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, height: 14.h),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
