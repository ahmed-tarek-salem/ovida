import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/shared/widgets/dose_tile.dart';
import 'package:ovida/src/core/constants/app_colors.dart';

class DailyDosesScreen extends StatelessWidget {
  const DailyDosesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: AppColors.primary),
          title: Text('Daily Doses',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary)),
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding, vertical: 24.h),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.lightGrey)),
                      SizedBox(width: 4.w),
                      Text(
                        "Today",
                        style: TextStyle(color: AppColors.lightGrey),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(child: Divider(color: AppColors.lightGrey))
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ...List.generate(
                    5,
                    (index) => DoseTile(
                        withOutDivider: false,
                        dividerColor: AppColors.lightBlue),
                  ),
                ],
              );
            }));
  }
}
