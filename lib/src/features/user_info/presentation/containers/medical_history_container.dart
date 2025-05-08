import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_theme.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class MedicalHistoryContainer extends StatelessWidget {
  const MedicalHistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var options = ["Option 1", "Option 2", "Option 3"];
    return ListView(
      children: [
        Text(
          'Add your medical history'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(height: 16.h),
        TextFieldWithHeader(
          header: "Chronic Diseases".hardCoded.hardCoded,
          textField: FormBuilderCheckboxGroup(
            name: "chronic_diseases",
            activeColor: AppColors.primary,
            options: [
              FormBuilderFieldOption(
                  value: "0",
                  child: Text(
                    "Diabetes",
                    style: choiceStyle,
                  )),
              FormBuilderFieldOption(
                  value: "1", child: Text("Hypertension", style: choiceStyle)),
              FormBuilderFieldOption(
                  value: "2", child: Text("Asthma", style: choiceStyle)),
              FormBuilderFieldOption(
                  value: "3", child: Text("Heart Disease", style: choiceStyle)),
            ],
          ),
        ),
        TextFieldWithHeader(
          header: "Allergies".hardCoded.hardCoded,
          textField: FormBuilderCheckboxGroup(
            name: "allergies",
            activeColor: AppColors.primary,
            options: [
              FormBuilderFieldOption(
                  value: "0",
                  child: Text(
                    "Allergy 1",
                    style: choiceStyle,
                  )),
              FormBuilderFieldOption(
                  value: "1", child: Text("Allergy 2", style: choiceStyle)),
              FormBuilderFieldOption(
                  value: "2", child: Text("Allergy 3", style: choiceStyle)),
              FormBuilderFieldOption(
                  value: "3", child: Text("Allergy 4", style: choiceStyle)),
            ],
          ),
        ),
        TextFieldWithHeader(
          header: "Previous Surgeries".hardCoded,
          textField: FormBuilderTextField(
            name: "previous_surgeries",
            decoration: InputDecoration(
                hintText: "Enter your previous surgeries".hardCoded),
          ),
        ),
        TextFieldWithHeader(
          header: "Family Medical History".hardCoded,
          textField: FormBuilderTextField(
            name: "family_medical_history",
            decoration: InputDecoration(
                hintText: "Add Family Medical History".hardCoded),
          ),
        ),
      ],
    );
  }
}
