import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/features/notifications/data/models/notification_model.dart';
import 'package:ovida/src/features/notifications/presentation/viewmodel/notifications_viewmodel.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    final viewmodel = di.get<NotificationsViewmodel>();

    return InkWell(
      onTap: () {
        if (!notification.read) {
          viewmodel.markAsRead(notification.id);
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color:
              notification.read ? AppColors.sectionsBackground : Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(
            color: Colors.grey[300]!,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (!notification.read)
                  Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              notification.message,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 8.h),
            Text(
              _formatDate(notification.createdAt),
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
