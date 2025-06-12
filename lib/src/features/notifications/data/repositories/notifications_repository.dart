import 'package:ovida/src/features/notifications/data/datasources/notifications_remote_datasource.dart';
import 'package:ovida/src/features/notifications/data/models/notification_model.dart';

abstract class NotificationsRepository {
  Future<List<NotificationModel>> getNotifications();
  Future<void> markAsRead(String id);
}

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDatasource _datasource;

  NotificationsRepositoryImpl(
      {required NotificationsRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  Future<List<NotificationModel>> getNotifications() async {
    return await _datasource.getNotifications();
  }

  @override
  Future<void> markAsRead(String id) async {
    return await _datasource.markAsRead(id);
  }
}
