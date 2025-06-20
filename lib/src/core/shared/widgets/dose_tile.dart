import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_icons.dart';

class DoseTile extends StatelessWidget {
  final DateTime time;
  final String medicine;
  final bool withOutDivider;
  final Color? dividerColor;
  const DoseTile(
      {super.key,
      required this.time,
      required this.medicine,
      this.withOutDivider = false,
      this.dividerColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('hh:mma').format(time).toLowerCase();
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
              Expanded(
                child: Text(
                  "$medicine - $formattedTime",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.r,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
        if (!withOutDivider)
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding * 2),
            child: Divider(color: dividerColor, height: 28.h),
          ),
      ],
    );
  }
}
