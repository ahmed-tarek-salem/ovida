import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class VitalSignsContainer extends StatelessWidget {
  const VitalSignsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your vital signs',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(height: 16.h),
        TextFieldWithHeader(
          header: "Blood Pressure".hardCoded,
          textField: Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: "systolic_pressure",
                  decoration: InputDecoration(
                    hintText: "120",
                    border: OutlineInputBorder(),
                    suffixText: "mmHg",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 8.w),
              Text("/",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              SizedBox(width: 8.w),
              Expanded(
                child: FormBuilderTextField(
                  name: "diastolic_pressure",
                  decoration: InputDecoration(
                    hintText: "80",
                    border: OutlineInputBorder(),
                    suffixText: "mmHg",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        TextFieldWithHeader(
          header: "Heart Rate".hardCoded,
          textField: FormBuilderTextField(
            name: "heart_rate",
            decoration: InputDecoration(
              hintText: "60",
              border: OutlineInputBorder(),
              suffixText: "bpm",
              suffixStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        TextFieldWithHeader(
          header: "Blood Glucose".hardCoded,
          textField: FormBuilderTextField(
            name: "blood_glucose",
            decoration: InputDecoration(
              hintText: "100",
              border: OutlineInputBorder(),
              suffixText: "mg/dL",
              suffixStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
