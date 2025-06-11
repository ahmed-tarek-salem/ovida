import 'package:ovida/src/core/constants/app_endpoints.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/utilities/error_handler.dart';
import 'package:ovida/src/features/home/data/models/doses_model.dart';

abstract class HomeRemoteDatasource {
  Future<DosesModel> getDoses();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final NetworkService _networkService;
  HomeRemoteDatasourceImpl({required NetworkService networkService})
      : _networkService = networkService;
  @override
  Future<DosesModel> getDoses() async {
    try {
      final response = await _networkService.get(AppEndpoints.getDoses);
      return DosesModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}
