import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 6.h),
        itemCount: 10,
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding, vertical: 24.h),
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                color: AppColors.sectionsBackground,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keep going!",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "You’ve taken 1 pill of Metformin at 3:00 PM.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ));
        },
      ),
    );
  }
}
