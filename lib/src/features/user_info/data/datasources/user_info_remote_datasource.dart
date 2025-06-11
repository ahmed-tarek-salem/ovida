import 'package:ovida/src/core/constants/app_endpoints.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/utilities/app_logger.dart';
import 'package:ovida/src/core/utilities/error_handler.dart';
import 'package:ovida/src/features/user_info/data/models/dropdown_menus_model.dart';
import 'package:ovida/src/features/user_info/data/models/medication_model.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';

abstract class UserInfoRemoteDatasource {
  Future<UserInfoResponse> getUserInfo();
  Future<DropdownMenusModel> getDropdownData();
  Future<List<MedicationModel>> getMedications();
  Future<void> updateUserInfo(Map<String, dynamic> body);
}

class UserInfoRemoteDatasourceImpl implements UserInfoRemoteDatasource {
  final NetworkService _networkService;

  UserInfoRemoteDatasourceImpl({required NetworkService networkService})
      : _networkService = networkService;
  @override
  Future<UserInfoResponse> getUserInfo() async {
    try {
      final response = await _networkService.get(
        AppEndpoints.getUserInfo,
      );
      return UserInfoResponse.fromJson(response.data);
    } catch (e) {
      appLogger.e("Error getting user info: $e");
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<DropdownMenusModel> getDropdownData() async {
    try {
      final response = await _networkService.get(
        AppEndpoints.getDropdownData,
      );
      return DropdownMenusModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<List<MedicationModel>> getMedications() async {
    try {
      final response = await _networkService.get(
        AppEndpoints.getMedications,
      );
      return List<MedicationModel>.from(
          response.data.map((x) => MedicationModel.fromJson(x)));
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<void> updateUserInfo(Map<String, dynamic> body) async {
    try {
      await _networkService.patch(
        AppEndpoints.updateUserInfo,
        data: body,
      );
      appLogger.d("Done updating user info");
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}
