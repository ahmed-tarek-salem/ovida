import 'package:ovida/src/core/constants/app_endpoints.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/utilities/error_handler.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';

abstract class UserInfoRemoteDatasource {
  Future<UserInfoResponse> getUserInfo();
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
      throw ErrorHandler.handleError(e);
    }
  }
}
