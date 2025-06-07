import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';

class TapToRemoveHints extends StatelessWidget {
  final String title;
  final String hint;
  const TapToRemoveHints({
    required this.title,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary)),
        Text(
          hint,
          style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary),
        )
      ],
    );
  }
}
