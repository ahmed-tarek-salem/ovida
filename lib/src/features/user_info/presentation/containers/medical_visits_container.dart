import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/add_button_with_icon.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/custom_dropdown_singleselection.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/tab_tile.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/tab_to_remove_hints.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class MedicalVisitsContainer extends StatefulWidget {
  const MedicalVisitsContainer({super.key});

  @override
  State<MedicalVisitsContainer> createState() => _MedicalVisitsContainerState();
}

class _MedicalVisitsContainerState extends State<MedicalVisitsContainer> {
  final viewmodel = di.get<UserInfoViewmodel>();
  String? subject;
  DateTime? dateOfVisit;
  String? diagnosis;
  String? treatmentPlan;
  String? nameOfDoctor;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your medical visits'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(height: 16.h),
        TextFieldWithHeader(
            header: "Recent Medical Visits".hardCoded,
            textField: CustomDropdownSingleSelection(
                items: viewmodel.dropdownMenus?.data.medicalSpecialties ?? [],
                onChanged: (selectedItem) {
                  subject = selectedItem;
                },
                searchHintText:
                    'Select a recent medical visit subject'.hardCoded)),
        TextFieldWithHeader(
            header: "Date of Visit".hardCoded,
            textField: FormBuilderDateTimePicker(
              name: "date_of_vist",
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy"),
              initialDate: DateTime(2025),
              lastDate: DateTime.now(),
              onChanged: (date) {
                dateOfVisit = date;
              },
              decoration: InputDecoration(
                  hintText: "Select date of visit".hardCoded,
                  suffixIcon: Icon(Icons.calendar_today)),
            )),
        TextFieldWithHeader(
          header: "Doctor's Name".hardCoded,
          textField: TextField(
            decoration: InputDecoration(
              hintText: "Ex: Dr. Smith".hardCoded,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              nameOfDoctor = value;
            },
          ),
        ),
        TextFieldWithHeader(
          header: "Diagnosis".hardCoded,
          textField: TextField(
            decoration: InputDecoration(
              hintText: "Example: Diabetes".hardCoded,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              diagnosis = value;
            },
          ),
        ),
        TextFieldWithHeader(
            header: "Treatment Plan".hardCoded,
            textField: CustomDropdownSingleSelection(
                items: viewmodel.dropdownMenus?.data.treatmentPlanOptions
                        .map((e) => e.category)
                        .toList() ??
                    [],
                onChanged: (selectedItem) {
                  treatmentPlan = selectedItem;
                },
                searchHintText: 'Select medical visits'.hardCoded)),
        AddButtonWithIcon(
            onPressed: () {
              if (subject != null && dateOfVisit != null && diagnosis != null ||
                  treatmentPlan != null) {
                viewmodel.addMedicalVisit(MedicalVisit(
                  healthcareProvider: HealthcareProvider(name: nameOfDoctor),
                  treatmentPlan: treatmentPlan == null
                      ? null
                      : TreatmentPlan(description: treatmentPlan!),
                  subject: subject,
                  dateOfVisit: dateOfVisit,
                  diagnosis: diagnosis,
                ));
              } else {
                LoadingOverlay.showErrorMessage(
                    "Please select a subject, date of visit, diagnosis and treatment plan"
                        .hardCoded);
              }
            },
            title: "Add Visit".hardCoded),
        SizedBox(height: 32.h),
        TapToRemoveHints(
          title: "Medical Visits".hardCoded,
          hint: "(Tap on a visit to remove)".hardCoded,
        ),
        SizedBox(height: 16.h),
        ListenableBuilder(
            listenable: viewmodel,
            builder: (context, child) {
              final medicalVisits = viewmodel.userInfo?.medicalVisits;
              if (medicalVisits == null || medicalVisits.isEmpty) {
                return Center(
                  child: Text(
                    "No medical visits added yet".hardCoded,
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
                children: medicalVisits.map((visit) {
                  return GestureDetector(
                    onTap: () {
                      viewmodel.removeMedicalVisit(visit);
                    },
                    child: TabTile(title: visit.subject ?? ""),
                  );
                }).toList(),
              );
            }),
        SizedBox(height: 32.h),
      ],
    );
  }
}
