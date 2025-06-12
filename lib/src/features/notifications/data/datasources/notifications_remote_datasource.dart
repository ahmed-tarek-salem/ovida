import 'package:ovida/src/core/constants/app_endpoints.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/utilities/error_handler.dart';
import 'package:ovida/src/features/notifications/data/models/notification_model.dart';

abstract class NotificationsRemoteDatasource {
  Future<List<NotificationModel>> getNotifications();
  Future<void> markAsRead(String id);
}

class NotificationsRemoteDatasourceImpl
    implements NotificationsRemoteDatasource {
  final NetworkService _networkService;

  NotificationsRemoteDatasourceImpl({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await _networkService.get(
        AppEndpoints.getNotifications,
      );
      return List<NotificationModel>.from(
          response.data.map((x) => NotificationModel.fromJson(x)));
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  @override
  Future<void> markAsRead(String id) async {
    try {
      await _networkService.put(
        '${AppEndpoints.markNotificationAsRead}/$id',
      );
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}
