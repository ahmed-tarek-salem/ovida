import 'package:ovida/src/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ovida/src/features/home/data/models/doses_model.dart';

abstract class HomeRepository {
  Future<DosesModel> getDoses();
  Future<void> cancelDose(String id);
  Future<void> takeDose(String id);
  Future<void> snoozeDose(String id, DateTime time);
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _datasource;

  HomeRepositoryImpl({required HomeRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  Future<DosesModel> getDoses() async {
    return await _datasource.getDoses();
  }

  @override
  Future<void> cancelDose(String id) async {
    return await _datasource.cancelDose(id);
  }

  @override
  Future<void> takeDose(String id) async {
    return await _datasource.takeDose(id);
  }

  @override
  Future<void> snoozeDose(String id, DateTime time) async {
    return await _datasource.snoozeDose(id, time);
  }
}
