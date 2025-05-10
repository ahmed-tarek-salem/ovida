import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Container(
                  width: 170.sp,
                  height: 170.sp,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: GradientBoxBorder(
                        gradient: AppColors.primaryGradient,
                        width: 2.sp,
                      ),
                      color: AppColors.sectionsBackground),
                  child: Center(
                      child: Text(
                    "FE",
                    style: TextStyle(fontSize: 72.sp),
                  )),
                ),
              ),
              SizedBox(height: 24.h),
              Text("Folan El-Folany",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: AppConstants.horizontalPadding),
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                decoration: BoxDecoration(
                    color: AppColors.sectionsBackground,
                    borderRadius: BorderRadius.circular(10.sp)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Medical History"),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios,
                              color: AppColors.primary, size: 16.sp),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                      height: 36.h,
                    ),
                    Row(
                      children: [
                        Text("Logout"),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios,
                              color: AppColors.primary, size: 16.sp),
                        )
                      ],
                    ),
                    // Divider(
                    //   color: Colors.white,
                    //   height: 36.h,
                    // ),
                  ],
                ),
              ),
              Spacer(),
              Image.asset(AppImages.fullLogo, height: 47.h),
              SizedBox(height: 40.h),
            ],
          ),
        ));
  }
}
