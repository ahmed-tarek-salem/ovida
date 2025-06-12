import 'package:ovida/src/core/constants/app_endpoints.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/utilities/error_handler.dart';
import 'package:ovida/src/features/home/data/models/doses_model.dart';

abstract class HomeRemoteDatasource {
  Future<DosesModel> getDoses();
  Future<void> cancelDose(String id);
  Future<void> takeDose(String id);
  Future<void> snoozeDose(String id, DateTime time);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final NetworkService _networkService;
  HomeRemoteDatasourceImpl({required NetworkService networkService})
      : _networkService = networkService;
  @override
  Future<DosesModel> getDoses() async {
    try {
      final response = await _networkService.get(AppEndpoints.getDoses);
      return DosesModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<void> cancelDose(String id) async {
    try {
      await _networkService.post(AppEndpoints.cancelDose(id));
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<void> takeDose(String id) async {
    try {
      await _networkService.post(AppEndpoints.takeDose(id));
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<void> snoozeDose(String id, DateTime time) async {
    try {
      await _networkService.post(AppEndpoints.snoozeDose(id),
          data: {'notificationTime': time.toIso8601String()});
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}
