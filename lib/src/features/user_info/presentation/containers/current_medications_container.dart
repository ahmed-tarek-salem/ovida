import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class CurrentMedicationsContainer extends StatelessWidget {
  const CurrentMedicationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your current medications'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.blue),
        ),
        SizedBox(height: 16),
        TextFieldWithHeader(
          header: "Current Medications".hardCoded,
          textField: FormBuilderTextField(
            name: "current_medications",
            decoration: InputDecoration(
              hintText: "Enter your current medications".hardCoded,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: TextFieldWithHeader(
              header: "Dosage".hardCoded,
              textField: FormBuilderTextField(
                name: "dosage",
                decoration: InputDecoration(
                  hintText: "Ex: 30ml".hardCoded,
                  border: OutlineInputBorder(),
                ),
              ),
            )),
            SizedBox(width: 8),
            Expanded(
                child: TextFieldWithHeader(
              header: "Frequency".hardCoded,
              textField: FormBuilderTextField(
                name: "frequency",
                decoration: InputDecoration(
                  hintText: "Ex: 2 times a day".hardCoded,
                  border: OutlineInputBorder(),
                ),
              ),
            )),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: TextFieldWithHeader(
              header: "Start Date".hardCoded,
              textField: FormBuilderTextField(
                name: "start_date",
                decoration: InputDecoration(
                  hintText: "Select Date".hardCoded,
                  border: OutlineInputBorder(),
                  suffixIcon: SvgPicture.asset(AppIcons.calendar,
                      height: 10.h, fit: BoxFit.scaleDown),
                ),
              ),
            )),
            SizedBox(width: 8),
            Expanded(
                child: TextFieldWithHeader(
              header: "End Date".hardCoded,
              textField: FormBuilderTextField(
                name: "end_date",
                decoration: InputDecoration(
                  hintText: "Select Date".hardCoded,
                  border: OutlineInputBorder(),
                  suffixIcon: SvgPicture.asset(AppIcons.calendar,
                      height: 10.h, fit: BoxFit.scaleDown),
                ),
              ),
            )),
          ],
        ),
        TextFieldWithHeader(
          header: "Name of Doctor".hardCoded,
          textField: FormBuilderTextField(
            name: "doctor_name",
            decoration: InputDecoration(
              hintText: "Enter your doctor's name".hardCoded,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        GradientButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Medication".hardCoded,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary),
              ),
              SizedBox(width: 18.w),
              SvgPicture.asset(AppIcons.add,
                  height: 16.h, fit: BoxFit.scaleDown),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Added medications".hardCoded,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary)),
            Text(
              "(Tap on a medication to remove)".hardCoded,
              style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary),
            )
          ],
        ),
        SizedBox(height: 16.h),
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 10.sp,
          spacing: 10.sp,
          children: [
            Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: AppColors.primaryGradient,
                    width: 2.sp,
                  ),
                  borderRadius: BorderRadius.circular(50.sp)),
              child: Text(
                "Medication Name".hardCoded,
                style: TextStyle(fontSize: 12.sp, color: AppColors.primary),
              ),
            ),
            Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: AppColors.primaryGradient,
                    width: 2.sp,
                  ),
                  borderRadius: BorderRadius.circular(50.sp)),
              child: Text(
                "Medication Name".hardCoded,
                style: TextStyle(fontSize: 12.sp, color: AppColors.primary),
              ),
            ),
          ],
        )
      ],
    );
  }
}
