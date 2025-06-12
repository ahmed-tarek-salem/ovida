import 'package:flutter/material.dart';
import 'package:ovida/src/core/shared/models/app_error_model.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/features/notifications/data/models/notification_model.dart';
import 'package:ovida/src/features/notifications/data/repositories/notifications_repository.dart';

class NotificationsViewmodel extends ChangeNotifier {
  final NotificationsRepository _repo;
  NotificationsViewmodel({required NotificationsRepository repo})
      : _repo = repo {
    getNotifications();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AppError? _error;
  AppError? get error => _error;

  List<NotificationModel>? _notifications;
  List<NotificationModel>? get notifications => _notifications;

  Future<void> getNotifications() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _notifications = await _repo.getNotifications();
    } on AppError catch (e) {
      _error = e;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      LoadingOverlay.show();
      await _repo.markAsRead(notificationId);

      // Update the local notification state
      final notificationIndex =
          _notifications?.indexWhere((n) => n.id == notificationId) ?? -1;
      if (notificationIndex != -1) {
        _notifications?[notificationIndex] = NotificationModel(
          id: _notifications![notificationIndex].id,
          user: _notifications![notificationIndex].user,
          title: _notifications![notificationIndex].title,
          message: _notifications![notificationIndex].message,
          read: true,
          createdAt: _notifications![notificationIndex].createdAt,
          updatedAt: DateTime.now(),
          v: _notifications![notificationIndex].v,
        );
        notifyListeners();
      }

      LoadingOverlay.showSuccessMessage("Notification marked as read");
    } on AppError catch (e) {
      LoadingOverlay.showErrorMessage(
          "Error marking notification as read: ${e.message}");
    }
  }
}
