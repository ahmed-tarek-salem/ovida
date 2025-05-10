import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/shared/widgets/dose_tile.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';
import 'package:ovida/src/features/daily_doses/presentation/screens/daily_doses_screen.dart';
import 'package:ovida/src/features/home/presentation/widgets/drug_info_dialog.dart';
import 'package:ovida/src/features/home/presentation/widgets/gradient_bordered_button_with_icon.dart';
import 'package:ovida/src/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:ovida/src/features/profile/presentation/screens/profile_screen.dart';

part '../containers/home_header_container.dart';
part '../containers/upcoming_dose_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.horizontalPadding,
                ),
                children: [
                  SizedBox(height: 16.h),
                  _HomeHeaderContainer(),
                  SizedBox(height: 24.h),
                  _UpcomingDoseContainer(),
                  SizedBox(height: 24.h),
                  _buildDailyDoses(context),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            _buildAddMedicineButton(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyDoses(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.sectionsBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Doses',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DailyDosesScreen();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      'view all',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.primary,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.r,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...List.generate(
            10,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => DrugInfoDialog(),
                  );
                },
                child: DoseTile(
                  withOutDivider: index == 9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddMedicineButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.horizontalPadding),
      child: GradientButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: AppColors.primary,
              size: 24.r,
            ),
            SizedBox(width: 8.w),
            Text(
              'Add a New Medicine',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
