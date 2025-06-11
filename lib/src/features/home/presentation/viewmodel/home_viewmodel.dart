import 'package:flutter/foundation.dart';
import 'package:ovida/src/core/shared/models/app_error_model.dart';
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
    // TODO: Implement take dose functionality
  }

  Future<void> skipDose(String doseId) async {
    // TODO: Implement skip dose functionality
  }

  Future<void> snoozeDose(String doseId, int minutes) async {
    // TODO: Implement snooze dose functionality
  }
}
