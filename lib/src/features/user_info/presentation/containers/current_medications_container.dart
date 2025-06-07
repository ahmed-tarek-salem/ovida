import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/add_button_with_icon.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/features/user_info/data/models/medication_model.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/medications_dropdown.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/tab_tile.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/tab_to_remove_hints.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/text_field_with_header.dart';

class CurrentMedicationsContainer extends StatefulWidget {
  const CurrentMedicationsContainer({super.key});

  @override
  State<CurrentMedicationsContainer> createState() =>
      _CurrentMedicationsContainerState();
}

class _CurrentMedicationsContainerState
    extends State<CurrentMedicationsContainer> {
  final viewmodel = di.get<UserInfoViewmodel>();
  MedicationModel? selectedMedication;
  String? dosage;
  String? frequency;
  DateTime? startDate;
  DateTime? endDate;
  String? doctorName;

  @override
  void initState() {
    super.initState();
    viewmodel.getMedications();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your current medications'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(height: 16),
        TextFieldWithHeader(
          header: "Current Medications".hardCoded,
          textField: MedicationsDropdown(
            items: viewmodel.medications ?? [],
            onChanged: (selectedItem) {
              selectedMedication = selectedItem;
            },
          ),
        ),
        Row(
          children: [
            Expanded(
                child: TextFieldWithHeader(
              header: "Dosage".hardCoded,
              textField: TextField(
                onChanged: (value) {
                  dosage = value;
                },
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
              textField: TextField(
                onChanged: (value) {
                  frequency = value;
                },
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
              textField: TextField(
                onChanged: (value) {
                  startDate = DateTime.parse(value);
                },
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
              textField: TextField(
                onChanged: (value) {
                  endDate = DateTime.parse(value);
                },
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
          textField: TextField(
            onChanged: (value) {
              doctorName = value;
            },
            decoration: InputDecoration(
              hintText: "Enter your doctor's name".hardCoded,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        AddButtonWithIcon(
          onPressed: () {
            if (selectedMedication != null) {
              viewmodel.addMedication(CurrentMedication(
                id: selectedMedication!.id,
                medication: selectedMedication!.brandName,
                dosage: dosage,
                frequency: frequency,
                startDate: startDate,
                endDate: endDate,
                prescribingDoctor: doctorName,
              ));
            } else {
              LoadingOverlay.showErrorMessage(
                  "Please select a medication".hardCoded);
            }
          },
          title: "Add Medication".hardCoded,
        ),
        SizedBox(height: 32.h),
        TapToRemoveHints(
          title: "Current Medications".hardCoded,
          hint: "(Tap on a medication to remove)".hardCoded,
        ),
        SizedBox(height: 16.h),
        ListenableBuilder(
            listenable: viewmodel,
            builder: (context, child) {
              final medications = viewmodel.userInfo?.currentMedications;
              if (medications == null || medications.isEmpty) {
                return Center(
                  child: Text(
                    "No medications added yet".hardCoded,
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
                children: medications.map((currentMedication) {
                  return GestureDetector(
                    onTap: () {
                      viewmodel.removeMedication(currentMedication);
                    },
                    child: TabTile(title: currentMedication.medication ?? ""),
                  );
                }).toList(),
              );
            })
      ],
    );
  }
}
