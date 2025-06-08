import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/shared/models/app_error_model.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/core/utilities/app_logger.dart';
import 'package:ovida/src/features/home/presentation/screens/home_screen.dart';
import 'package:ovida/src/features/user_info/data/models/dropdown_menus_model.dart';
import 'package:ovida/src/features/user_info/data/models/medication_model.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';
import 'package:ovida/src/features/user_info/data/repositories/user_info_repo.dart';
import 'package:ovida/src/features/user_info/presentation/containers/current_medications_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/lap_reports_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/medical_history_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/medical_visits_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/personal_info_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/vital_signs_container.dart';

class UserInfoViewmodel extends ChangeNotifier {
  final UserInfoRepository _repo;
  UserInfoViewmodel({required UserInfoRepository repo}) : _repo = repo;
  int pageIndex = 0;
  UserInfoResponse? userInfo;
  DropdownMenusModel? dropdownMenus;
  List<MedicationModel>? medications;
  bool isLoading = false;
  AppError? error;
  final formKey = GlobalKey<FormBuilderState>();

  void updatePageIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }

  final List<Widget> containers = [
    PersonalInfoContainer(),
    MedicalHistoryContainer(),
    CurrentMedicationsContainer(),
    MedicalVisitsContainer(),
    LapReportsContainer(),
    VitalSignsContainer(),
  ];

  Future<void> getUserInfo() async {
    final response = await _repo.getUserInfo();
    userInfo = response;
  }

  Future<void> getDropdownMenus() async {
    final response = await _repo.getDropdownData();
    dropdownMenus = response;
  }

  Future<void> getMedications() async {
    final response = await _repo.getMedications();
    medications = response;
  }

  Future<void> getData() async {
    try {
      isLoading = true;
      error = null;
      await Future.wait([
        getUserInfo(),
        getDropdownMenus(),
        getMedications(),
      ]);
    } on AppError catch (e) {
      error = e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addMedication(CurrentMedication medication) async {
    if (!userInfo!.currentMedications.contains(medication)) {
      userInfo?.currentMedications.add(medication);
      notifyListeners();
    } else {
      LoadingOverlay.showErrorMessage(
          "Already added, please remove it first".hardCoded);
    }
  }

  void removeMedication(CurrentMedication medication) {
    userInfo?.currentMedications.remove(medication);
    notifyListeners();
  }

  void addMedicalVisit(MedicalVisit visit) {
    if (!userInfo!.medicalVisits.contains(visit)) {
      userInfo?.medicalVisits.add(visit);
      notifyListeners();
    } else {
      LoadingOverlay.showErrorMessage(
          "Already added, please remove it first".hardCoded);
    }
  }

  void removeMedicalVisit(MedicalVisit visit) {
    userInfo?.medicalVisits.remove(visit);
    notifyListeners();
  }

  void addLabReport(LaboratoryReport report) {
    if (!userInfo!.laboratoryReports.contains(report)) {
      userInfo?.laboratoryReports.add(report);
      notifyListeners();
    } else {
      LoadingOverlay.showErrorMessage(
          "Already added, please remove it first".hardCoded);
    }
  }

  void removeLabReport(LaboratoryReport report) {
    userInfo?.laboratoryReports.remove(report);
    notifyListeners();
  }

  void addVitalSign(VitalSign vitalSign) {
    userInfo?.vitalSigns.add(vitalSign);
    notifyListeners();
  }

  void removeVitalSign(VitalSign vitalSign) {
    userInfo?.vitalSigns.remove(vitalSign);
    notifyListeners();
  }

  Future<void> submitForm(BuildContext context) async {
    try {
      LoadingOverlay.show();
      if (formKey.currentState?.saveAndValidate() ?? false) {
        final formData = formKey.currentState?.value;
        appLogger.d("Form Data: $formData");
        await _repo.updateUserInfo(buildRequestBody());
      } else {
        appLogger.e("Form validation failed");
      }
      LoadingOverlay.hide();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      appLogger.e("Error submitting form: $e");
      LoadingOverlay.showErrorMessage("Failed to update user info".hardCoded);
    }
  }

  Map<String, dynamic> buildRequestBody() {
    final formData = formKey.currentState?.value;
    Map<String, dynamic> requestBody = {
      "firstName": formData?["firstName"],
      "dateOfBirth": formData?["dateOfBirth"]?.toIso8601String(),
      "gender": formData?["gender"],
      "emergencyContact": formData?["emergencyContact"],
      "chronicDiseases": formData?["chronicDiseases"],
      "allergies": formData?["allergies"],
      "previousSurgeries": formData?["previousSurgeries"],
      "familyMedicalHistory": formData?["familyMedicalHistory"],
      "currentMedications": userInfo?.currentMedications
          .map((medication) => {
                "action": "add",
                "medication": medication.id,
                "dosage": medication.dosage,
                "frequency": medication.frequency,
                "startDate": medication.startDate?.toIso8601String(),
                "endDate": medication.endDate?.toIso8601String(),
                "prescribingDoctor": medication.prescribingDoctor,
              })
          .toList(),
      "medicalVisits": userInfo?.medicalVisits
          .map((visit) => {
                "action": "add",
                "subject": visit.subject,
                "dateOfVisit": visit.dateOfVisit?.toIso8601String(),
                "healthcareProvider": visit.healthcareProvider?.toJson(),
                "diagnosis": visit.diagnosis,
                "treatmentPlan": visit.treatmentPlan?.toJson(),
              })
          .toList(),
      "laboratoryReports": userInfo?.laboratoryReports
          .map((report) => {
                "action": "add",
                "testType": report.testType,
                "testDate": report.testDate?.toIso8601String(),
                "resultsSummary": report.resultsSummary,
              })
          .toList(),
      "vitalSigns": userInfo?.vitalSigns
          .map((vs) => {
                "action": "add",
                "bloodPressure": vs.bloodPressure?.toJson(),
                "heartRate": vs.heartRate,
                "bloodGlucoseLevel": vs.bloodGlucoseLevel,
              })
          .toList(),
    };

    return requestBody;
  }
}
