import 'package:ovida/src/features/user_info/data/datasources/user_info_remote_datasource.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';

abstract class UserInfoRepository {
  Future<UserInfoResponse> getUserInfo();
}

class UserInfoRepositoryImpl implements UserInfoRepository {
  final UserInfoRemoteDatasource _datasource;

  UserInfoRepositoryImpl({required UserInfoRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  Future<UserInfoResponse> getUserInfo() async {
    return _datasource.getUserInfo();
  }
}
