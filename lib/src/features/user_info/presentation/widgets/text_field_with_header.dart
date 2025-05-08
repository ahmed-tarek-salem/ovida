import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';

class TextFieldWithHeader extends StatelessWidget {
  final String header;
  final Widget textField;
  const TextFieldWithHeader(
      {super.key, required this.header, required this.textField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.secondary),
        ),
        SizedBox(height: 8.h),
        textField,
        SizedBox(height: 16.h),
      ],
    );
  }
}
