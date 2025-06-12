import 'package:flutter/foundation.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/services/local_storage/local_storage.dart';
import 'package:ovida/src/core/shared/models/app_error_model.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/features/home/data/models/doses_model.dart';
import 'package:ovida/src/features/home/data/repositories/home_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final HomeRepository _repo;
  HomeViewmodel({required HomeRepository repo}) : _repo = repo {
    getDoses();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AppError? _error;
  AppError? get error => _error;

  DosesModel? _doses;
  DosesModel? get doses => _doses;

  Future<void> getDoses() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _doses = await _repo.getDoses();
    } on AppError catch (e) {
      _error = e;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> takeDose(String doseId) async {
    try {
      LoadingOverlay.show();
      await _repo.takeDose(doseId);
      LoadingOverlay.showSuccessMessage("Dose taken successfully");
      getDoses();
    } on AppError catch (e) {
      LoadingOverlay.showErrorMessage("Error taking dose, please try again $e");
    }
  }

  Future<void> skipDose(String doseId) async {
    try {
      LoadingOverlay.show();
      await _repo.cancelDose(doseId);
      LoadingOverlay.showSuccessMessage("Dose skipped successfully");
      getDoses();
    } on AppError catch (e) {
      LoadingOverlay.showErrorMessage(
          "Error skipping dose, please try again $e");
    }
  }

  Future<void> snoozeDose(String doseId, DateTime time) async {
    try {
      LoadingOverlay.show();
      await _repo.snoozeDose(doseId, time.add(Duration(minutes: 10)));
      LoadingOverlay.showSuccessMessage("Dose snoozed successfully");
      getDoses();
    } on AppError catch (e) {
      LoadingOverlay.showErrorMessage(
          "Error snoozing dose, please try again $e");
    }
  }
}
