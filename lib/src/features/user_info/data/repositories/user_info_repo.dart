import 'package:ovida/src/features/user_info/data/models/dropdown_menus_model.dart';
import 'package:ovida/src/features/user_info/data/datasources/user_info_remote_datasource.dart';
import 'package:ovida/src/features/user_info/data/models/medication_model.dart';
import 'package:ovida/src/features/user_info/data/models/user_info_response.dart';

abstract class UserInfoRepository {
  Future<UserInfoResponse> getUserInfo();
  Future<DropdownMenusModel> getDropdownData();
  Future<List<MedicationModel>> getMedications();
  Future<void> updateUserInfo(Map<String, dynamic> body);
}

class UserInfoRepositoryImpl implements UserInfoRepository {
  final UserInfoRemoteDatasource _datasource;

  UserInfoRepositoryImpl({required UserInfoRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  Future<UserInfoResponse> getUserInfo() async {
    return _datasource.getUserInfo();
  }

  @override
  Future<DropdownMenusModel> getDropdownData() async {
    return await _datasource.getDropdownData();
  }

  @override
  Future<List<MedicationModel>> getMedications() async {
    return await _datasource.getMedications();
  }

  @override
  Future<void> updateUserInfo(Map<String, dynamic> body) async {
    return await _datasource.updateUserInfo(body);
  }
}
