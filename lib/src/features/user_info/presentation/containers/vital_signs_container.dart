import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/add_button_with_icon.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/tab_tile.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/tab_to_remove_hints.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class VitalSignsContainer extends StatefulWidget {
  const VitalSignsContainer({super.key});

  @override
  State<VitalSignsContainer> createState() => _VitalSignsContainerState();
}

class _VitalSignsContainerState extends State<VitalSignsContainer> {
  final viewmodel = di.get<UserInfoViewmodel>();
  final _formKey = GlobalKey<FormBuilderState>();

  int? systolicPressure;
  int? diastolicPressure;
  int? heartRate;
  int? bloodGlucose;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your vital signs'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(height: 16.h),
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              TextFieldWithHeader(
                header: "Blood Pressure".hardCoded,
                textField: Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: "systolic_pressure",
                        decoration: InputDecoration(
                          hintText: "120".hardCoded,
                          border: OutlineInputBorder(),
                          suffixText: "mmHg",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value != null) {
                            systolicPressure = int.tryParse(value);
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text("/",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: FormBuilderTextField(
                        name: "diastolic_pressure",
                        decoration: InputDecoration(
                          hintText: "80".hardCoded,
                          border: OutlineInputBorder(),
                          suffixText: "mmHg",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value != null) {
                            diastolicPressure = int.tryParse(value);
                          }
                        },
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
                    hintText: "60".hardCoded,
                    border: OutlineInputBorder(),
                    suffixText: "bpm",
                    suffixStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value != null) {
                      heartRate = int.tryParse(value);
                    }
                  },
                ),
              ),
              TextFieldWithHeader(
                header: "Blood Glucose".hardCoded,
                textField: FormBuilderTextField(
                  name: "blood_glucose",
                  decoration: InputDecoration(
                    hintText: "100".hardCoded,
                    border: OutlineInputBorder(),
                    suffixText: "mg/dL",
                    suffixStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value != null) {
                      bloodGlucose = int.tryParse(value);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        AddButtonWithIcon(
          onPressed: () {
            if (systolicPressure != null && diastolicPressure != null) {
              viewmodel.addVitalSign(VitalSign(
                bloodPressure: BloodPressure(
                  systolic: systolicPressure,
                  diastolic: diastolicPressure,
                ),
                heartRate: heartRate,
                bloodGlucoseLevel: bloodGlucose,
              ));
            } else {
              LoadingOverlay.showErrorMessage(
                  "Please enter at least blood pressure readings".hardCoded);
            }
          },
          title: "Add Vital Signs".hardCoded,
        ),
        SizedBox(height: 32.h),
        TapToRemoveHints(
          title: "Vital Signs".hardCoded,
          hint: "(Tap on a vital sign to remove)".hardCoded,
        ),
        SizedBox(height: 16.h),
        ListenableBuilder(
            listenable: viewmodel,
            builder: (context, child) {
              final vitalSigns = viewmodel.userInfo?.vitalSigns;
              if (vitalSigns == null || vitalSigns.isEmpty) {
                return Center(
                  child: Text(
                    "No vital signs added yet".hardCoded,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary),
                  ),
                );
              }
              return Wrap(
                direction: Axis.horizontal,
                runSpacing: 10.sp,
                spacing: 10.sp,
                children: vitalSigns.map((vitalSign) {
                  return GestureDetector(
                    onTap: () {
                      viewmodel.removeVitalSign(vitalSign);
                    },
                    child: TabTile(
                      title:
                          "${vitalSign.bloodPressure?.systolic}/${vitalSign.bloodPressure?.diastolic} mmHg",
                    ),
                  );
                }).toList(),
              );
            }),
      ],
    );
  }
}
