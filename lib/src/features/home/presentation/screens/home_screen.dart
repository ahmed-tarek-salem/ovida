import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
          ),
          children: [
            SizedBox(height: 16.h),
            _buildHeader(),
            SizedBox(height: 24.h),
            _buildUpcomingDose(context),
            SizedBox(height: 24.h),
            _buildDailyDoses(),
            SizedBox(height: 24.h),
            _buildAddMedicineButton(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Folan El-Folany',
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppIcons.notifications,
            height: 32.r,
          ),
        ),
        CircleAvatar(
          radius: 16.r,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, color: Colors.white, size: 24.r),
        ),
      ],
    );
  }

  Widget _buildUpcomingDose(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.sectionsBackground,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Dose!',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('Your next dose of Hemoclar at 03:00pm',
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildActionButton(
                onTap: () {},
                text: 'Take',
                icon: Icons.check_circle_outline,
                isPrimary: true,
              ),
              SizedBox(width: 8.w),
              _buildActionButton(
                onTap: () {},
                text: 'Skip',
                icon: Icons.close,
              ),
              SizedBox(width: 8.w),
              _buildActionButton(
                onTap: () {},
                text: 'Snooze for 10 mins',
                icon: Icons.timer_outlined,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100.r,
                  width: 100.r,
                  child: CircularProgressIndicator(
                    value: 0.75,
                    strokeWidth: 8.r,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '15',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'mins',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onTap,
    required String text,
    required IconData icon,
    bool isPrimary = false,
  }) {
    return Expanded(
      child: Material(
        color: isPrimary ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              border:
                  isPrimary ? null : Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: isPrimary ? Colors.white : Colors.grey,
                  size: 20.r,
                ),
                SizedBox(height: 4.h),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isPrimary ? Colors.white : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDailyDoses() {
    final doses = [
      {'time': '09:00am', 'medicine': 'Paracetamol', 'taken': true},
      {'time': '01:00pm', 'medicine': 'Amoxicillin', 'taken': false},
      {'time': '05:00pm', 'medicine': 'Omeprazole', 'taken': true},
      {'time': '09:00pm', 'medicine': 'Cetirizine', 'taken': true},
      {'time': '01:00am', 'medicine': 'Metformin', 'taken': false},
      {'time': '05:00am', 'medicine': 'Lisinopril', 'taken': true},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Daily Doses',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'view all',
                    style: TextStyle(
                      fontSize: 14.sp,
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
        ...doses.map((dose) => _buildDoseItem(
              time: dose['time'] as String,
              medicine: dose['medicine'] as String,
              taken: dose['taken'] as bool,
            )),
      ],
    );
  }

  Widget _buildDoseItem({
    required String time,
    required String medicine,
    required bool taken,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: taken
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  taken ? Icons.check : Icons.close,
                  color: taken ? Colors.green : Colors.red,
                  size: 16.r,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    medicine,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.r,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddMedicineButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.r),
          ),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
