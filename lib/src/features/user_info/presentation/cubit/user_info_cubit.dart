import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ovida/src/features/user_info/presentation/containers/current_medications_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/lap_reports_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/medical_history_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/medical_visits_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/personal_info_container.dart';
import 'package:ovida/src/features/user_info/presentation/containers/vital_signs_container.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial(currentIndex: 0));

  void updatePageIndex(int index) {
    emit(UserInfoUpdated(currentIndex: index));
  }

  final List<Widget> containers = [
    PersonalInfoContainer(),
    MedicalHistoryContainer(),
    CurrentMedicationsContainer(),
    MedicalVisitsContainer(),
    LapReportsContainer(),
    VitalSignsContainer(),
  ];
}
