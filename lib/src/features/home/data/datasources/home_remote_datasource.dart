import 'package:ovida/src/core/services/network/network_service.dart';

abstract class HomeRemoteDatasource {
  Future<void> getDailyDoses();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final NetworkService _networkService;
  HomeRemoteDatasourceImpl({required NetworkService networkService})
      : _networkService = networkService;
  @override
  Future<void> getDailyDoses() async {
    // try {
    //   final response = await _networkService.get(
    //     AppEndpoints.getMedications,
    //   );
    //   return List<MedicationModel>.from(
    //       response.data.map((x) => MedicationModel.fromJson(x)));
    // } catch (e) {
    //   throw ErrorHandler.handleError(e);
    // }
  }
}
