import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';

class CustomStepper extends StatelessWidget {
  final int currentIndex;

  const CustomStepper({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                color:
                    index <= currentIndex ? null : AppColors.sectionsBackground,
                gradient:
                    index <= currentIndex ? AppColors.primaryGradient : null,
              ),
            ),
          ),
        );
      }),
    );
  }
}
