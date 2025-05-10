import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';

class DoseTile extends StatelessWidget {
  final String time;
  final String medicine;
  final bool withOutDivider;
  const DoseTile(
      {super.key,
      required this.time,
      required this.medicine,
      this.withOutDivider = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.take,
                height: 16.r,
              ),
              SizedBox(width: 18.w),
              Text(
                medicine,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.r,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
        if (!withOutDivider) Divider(color: Colors.white, height: 28.h),
      ],
    );
  }
}
