import 'package:ovida/src/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:ovida/src/features/profile/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<void> updateProfile(Map<String, dynamic> profileData);
  Future<ProfileModel> getProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource _remoteDatasource;

  ProfileRepositoryImpl({required ProfileRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  @override
  Future<void> updateProfile(Map<String, dynamic> profileData) async {
    // await _remoteDatasource.updateProfile(profileData);
  }

  @override
  Future<ProfileModel> getProfile() async {
    return await _remoteDatasource.getProfile();
  }
}
