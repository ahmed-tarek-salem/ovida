import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/add_button_with_icon.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/core/utilities/app_logger.dart';
import 'package:ovida/src/features/user_info/data/models/medication_model.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/custom_dropdown_singleselection.dart';
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
              textField: CustomDropdownSingleSelection(
                searchHintText: "Select frequency".hardCoded,
                items: [
                  "once-daily",
                  "twice-daily",
                  "three-times-daily",
                  "four-times-daily",
                ],
                onChanged: (val) {
                  frequency = val;
                },
              ),
            )),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWithHeader(
                  header: "Start Date".hardCoded,
                  textField: FormBuilderDateTimePicker(
                    name: "start_date",
                    inputType: InputType.date,
                    format: DateFormat("dd/MM/yyyy"),
                    initialDate: DateTime(2025),
                    lastDate: DateTime.now(),
                    onChanged: (date) {
                      startDate = date;
                    },
                    decoration: InputDecoration(
                        hintText: "Select start date".hardCoded,
                        suffixIcon: Icon(Icons.calendar_today)),
                  )),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextFieldWithHeader(
                  header: "End Date".hardCoded,
                  textField: FormBuilderDateTimePicker(
                    name: "end_date",
                    inputType: InputType.date,
                    format: DateFormat("dd/MM/yyyy"),
                    initialDate: DateTime(2025),
                    lastDate: DateTime.now(),
                    onChanged: (date) {
                      startDate = date;
                    },
                    decoration: InputDecoration(
                        hintText: "Select end date".hardCoded,
                        suffixIcon: Icon(Icons.calendar_today)),
                  )),
            ),
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
            if (selectedMedication != null && startDate != null) {
              viewmodel.addMedication(CurrentMedication(
                id: selectedMedication!.id,
                brandName: selectedMedication!.brandName,
                dosage: dosage,
                frequency: frequency,
                startDate: startDate,
                endDate: endDate,
                prescribingDoctor: doctorName,
              ));
            } else {
              LoadingOverlay.showErrorMessage(
                  "Please select a medication and a start date".hardCoded);
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
              appLogger.d(medications?.first.brandName);
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
                    child: TabTile(title: currentMedication.brandName ?? ""),
                  );
                }).toList(),
              );
            })
      ],
    );
  }
}
