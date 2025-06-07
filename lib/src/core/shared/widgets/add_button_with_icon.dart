import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';

class AddButtonWithIcon extends StatelessWidget {
  const AddButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary),
          ),
          SizedBox(width: 18.w),
          SvgPicture.asset(AppIcons.add, height: 16.h, fit: BoxFit.scaleDown),
        ],
      ),
    );
  }
}
