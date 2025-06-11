import 'package:ovida/src/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ovida/src/features/home/data/models/doses_model.dart';

abstract class HomeRepository {
  Future<DosesModel> getDoses();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _datasource;

  HomeRepositoryImpl({required HomeRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  Future<DosesModel> getDoses() async {
    return await _datasource.getDoses();
  }
}
