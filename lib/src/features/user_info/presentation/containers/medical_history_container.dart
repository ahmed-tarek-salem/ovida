import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/custom_dropdown_multiselection.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class MedicalHistoryContainer extends StatelessWidget {
  const MedicalHistoryContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final viewmodel = di.get<UserInfoViewmodel>();

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
          textField: FormBuilderField<List<String>>(
            name: 'chronicDiseases',
            builder: (FormFieldState<List<String>> field) {
              return CustomDropdownMultiSelection(
                initialSelectedItems:
                    viewmodel.userInfo?.user.chronicDiseases ?? [],
                items: viewmodel.dropdownMenus?.data.chronicDiseases ?? [],
                searchHintText: 'Select chronic diseases'.hardCoded,
                onChanged: (selectedItems) {
                  field.didChange(selectedItems);
                  print(viewmodel
                      .formKey.currentState?.fields['chronicDiseases']?.value);
                },
              );
            },
          ),
        ),
        TextFieldWithHeader(
          header: "Allergies".hardCoded.hardCoded,
          textField: FormBuilderField<List<String>>(
              name: 'allergies',
              builder: (FormFieldState<List<String>> field) {
                return CustomDropdownMultiSelection(
                  initialSelectedItems:
                      viewmodel.userInfo?.user.allergies ?? [],
                  items: viewmodel.dropdownMenus?.data.foodAllergies ?? [],
                  searchHintText: 'Select allergies'.hardCoded,
                  onChanged: (selectedItems) {
                    field.didChange(selectedItems);
                    print(viewmodel.formKey.currentState
                        ?.fields['chronicDiseases']?.value);
                  },
                );
              }),
        ),
        TextFieldWithHeader(
          header: "Previous Surgeries".hardCoded,
          textField: FormBuilderField<List<String>>(
              name: 'previousSurgeries',
              builder: (FormFieldState<List<String>> field) {
                return CustomDropdownMultiSelection(
                  initialSelectedItems:
                      viewmodel.userInfo?.user.previousSurgeries ?? [],
                  items: viewmodel.dropdownMenus?.data.previousSurgeries ?? [],
                  searchHintText: 'Select surgeries'.hardCoded,
                  onChanged: (selectedItems) {
                    field.didChange(selectedItems);
                    print("Selected items: $selectedItems");
                  },
                );
              }),
        ),
        TextFieldWithHeader(
          header: "Family Medical History".hardCoded,
          textField: FormBuilderField<List<String>>(
              name: 'familyMedicalHistory',
              builder: (FormFieldState<List<String>> field) {
                return CustomDropdownMultiSelection(
                  initialSelectedItems:
                      viewmodel.userInfo?.user.familyMedicalHistory ?? [],
                  items:
                      viewmodel.dropdownMenus?.data.familyMedicalConditions ??
                          [],
                  searchHintText: 'Select medical history'.hardCoded,
                  onChanged: (selectedItems) {
                    field.didChange(selectedItems);
                    print("Selected items: $selectedItems");
                  },
                );
              }),
        ),
      ],
    );
  }
}
