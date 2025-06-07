import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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
import 'package:intl/intl.dart';

class LapReportsContainer extends StatefulWidget {
  const LapReportsContainer({super.key});

  @override
  State<LapReportsContainer> createState() => _LapReportsContainerState();
}

class _LapReportsContainerState extends State<LapReportsContainer> {
  final viewmodel = di.get<UserInfoViewmodel>();
  final TextEditingController resultsSummaryController =
      TextEditingController();
  String? testType;
  DateTime? testDate;
  String? resultsSummary;

  @override
  void dispose() {
    resultsSummaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Add your lab reports'.hardCoded,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(height: 16.h),
        TextFieldWithHeader(
            header: "Test Type".hardCoded,
            textField: CustomDropdownSingleSelection(
                items: viewmodel.dropdownMenus?.data.medicalTestsCatalog ?? [],
                onChanged: (val) {
                  testType = val;
                })),
        TextFieldWithHeader(
            header: "Test Date".hardCoded,
            textField: FormBuilderDateTimePicker(
              name: "test_date",
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy"),
              initialDate: DateTime(2000),
              lastDate: DateTime.now(),
              onChanged: (date) {
                testDate = date;
              },
              decoration: InputDecoration(
                  hintText: "Select test date".hardCoded,
                  suffixIcon: Icon(Icons.calendar_today)),
            )),
        TextFieldWithHeader(
          header: "Results Summary".hardCoded,
          textField: TextField(
            controller: resultsSummaryController,
            decoration: InputDecoration(
              hintText: "Enter the results summary".hardCoded,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              resultsSummary = value;
            },
          ),
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 8.sp,
          runSpacing: 4.sp,
          children: [
            GestureDetector(
                onTap: () {
                  resultsSummaryController.text = "Elevated".hardCoded;
                },
                child: TabTile(title: "Elevated".hardCoded)),
            GestureDetector(
                onTap: () {
                  resultsSummaryController.text = "Declined".hardCoded;
                },
                child: TabTile(title: "Declined".hardCoded)),
            GestureDetector(
                onTap: () {
                  resultsSummaryController.text = "Normal".hardCoded;
                },
                child: TabTile(title: "Normal".hardCoded)),
            GestureDetector(
                onTap: () {
                  resultsSummaryController.text = "Unknown".hardCoded;
                },
                child: TabTile(title: "Unkown".hardCoded)),
          ],
        ),
        SizedBox(height: 16.h),
        AddButtonWithIcon(
          onPressed: () {
            if (testType != null && resultsSummary != null) {
              viewmodel.addLabReport(LaboratoryReport(
                testType: testType,
                testDate: testDate,
                resultsSummary: resultsSummary,
              ));
            } else {
              LoadingOverlay.showErrorMessage(
                  "Please select a test type and results summary".hardCoded);
            }
          },
          title: "Add Lab Report".hardCoded,
        ),
        SizedBox(height: 16.h),
        TapToRemoveHints(
            title: "Lab Reports".hardCoded,
            hint: "(Tap on a report to remove)".hardCoded),
        SizedBox(height: 32.h),
        ListenableBuilder(
            listenable: viewmodel,
            builder: (context, child) {
              final labReports = viewmodel.userInfo?.laboratoryReports;
              if (labReports == null || labReports.isEmpty) {
                return Center(
                  child: Text(
                    "No lab reports added yet".hardCoded,
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
                children: labReports.map((report) {
                  return GestureDetector(
                    onTap: () {
                      viewmodel.removeLabReport(report);
                    },
                    child: TabTile(title: report.testType ?? ""),
                  );
                }).toList(),
              );
            }),
      ],
    );
  }
}
