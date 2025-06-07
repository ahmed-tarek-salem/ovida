import 'package:ovida/src/core/constants/app_endpoints.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/utilities/error_handler.dart';
import 'package:ovida/src/features/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDatasource {
  Future<void> updateProfile(Map<String, dynamic> profileData);
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final NetworkService _networkService;

  ProfileRemoteDatasourceImpl({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<void> updateProfile(Map<String, dynamic> profileData) async {
    // try {
    //   await _networkService.put(
    //     AppEndpoints.updateProfile,
    //     data: profileData,
    //   );
    // } catch (e) {
    //   throw ErrorHandler.handleError(e);
    // }
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await _networkService.get(
        AppEndpoints.getUserInfo,
      );
      return ProfileModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}
