import 'package:ovida/src/features/auth/data/datasources/auth_remote_datasource/auth_remote_datasource.dart';
import 'package:ovida/src/features/auth/data/models/sign_up_request.dart';
import 'package:ovida/src/features/auth/data/models/sign_up_response.dart';

abstract class AuthRepository {
  Future<SignUpResponse> signUp(SignUpRequest request);
  Future<SignUpResponse> login(SignUpRequest request);
  Future<void> postFcmToken(String token);
  Future<void> logout();
  Future<void> removeFcmToken(String token);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _datasource;
  AuthRepositoryImpl({required AuthRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  Future<SignUpResponse> signUp(SignUpRequest request) async {
    return _datasource.signUp(request);
  }

  @override
  Future<SignUpResponse> login(SignUpRequest request) async {
    return _datasource.login(request);
  }

  @override
  Future<void> postFcmToken(String token) async {
    return _datasource.postFcmToken(token);
  }

  @override
  Future<void> logout() async {
    return _datasource.logout();
  }

  @override
  Future<void> removeFcmToken(String token) async {
    return _datasource.removeFcmToken(token);
  }
}
