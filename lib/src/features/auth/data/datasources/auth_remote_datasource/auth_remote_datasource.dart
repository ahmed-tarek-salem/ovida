import 'package:ovida/src/core/constants/app_endpoints.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/utilities/error_handler.dart';
import 'package:ovida/src/features/auth/data/models/sign_up_request.dart';
import 'package:ovida/src/features/auth/data/models/sign_up_response.dart';

abstract class AuthRemoteDatasource {
  Future<SignUpResponse> signUp(SignUpRequest request);
  Future<SignUpResponse> login(SignUpRequest request);
  Future<void> postFcmToken(String token);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final NetworkService _networkService;

  AuthRemoteDatasourceImpl({required NetworkService networkService})
      : _networkService = networkService;
  @override
  Future<SignUpResponse> signUp(SignUpRequest request) async {
    try {
      final response = await _networkService.post(
        AppEndpoints.signup,
        data: request.toJson(),
      );
      return SignUpResponse.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<SignUpResponse> login(SignUpRequest request) async {
    try {
      final response = await _networkService.post(
        AppEndpoints.login,
        data: request.toJson(),
      );
      return SignUpResponse.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<void> postFcmToken(String token) async {
    try {
      await _networkService.post(
        AppEndpoints.fcmToken,
        data: {"token": token},
      );
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}
