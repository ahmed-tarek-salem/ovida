import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ovida/src/core/constants/app_colors.dart';

class TabTile extends StatelessWidget {
  final String title;
  const TabTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: AppColors.primaryGradient,
            width: 2.sp,
          ),
          borderRadius: BorderRadius.circular(50.sp)),
      child: Text(
        title,
        style: TextStyle(fontSize: 12.sp, color: AppColors.primary),
      ),
    );
  }
}
