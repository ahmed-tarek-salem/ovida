import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ovida/src/core/shared/models/app_error_model.dart';
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
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final response = await _repo.getUserInfo();
      userInfo = response;
    } on AppError catch (e) {
      error = e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
