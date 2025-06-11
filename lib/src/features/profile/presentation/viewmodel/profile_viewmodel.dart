import 'package:flutter/material.dart';
import 'package:ovida/src/core/utilities/app_logger.dart';
import 'package:ovida/src/features/profile/data/models/profile_model.dart';
import 'package:ovida/src/features/profile/data/repositories/profile_repository.dart';

class ProfileViewmodel extends ChangeNotifier {
  final ProfileRepository _repository;

  ProfileViewmodel({required ProfileRepository repository})
      : _repository = repository;

  ProfileModel? profile;

  Future<void> updateProfile(Map<String, dynamic> profileData) async {
    await _repository.updateProfile(profileData);
  }

  Future<void> getProfile() async {
    try {
      profile = await _repository.getProfile();
      notifyListeners();
    } catch (e) {
      appLogger.e(e);
    }
  }
}
