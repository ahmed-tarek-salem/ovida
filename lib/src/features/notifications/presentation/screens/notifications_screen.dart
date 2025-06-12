import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/error_widget.dart';
import 'package:ovida/src/core/shared/widgets/loading_widget.dart';
import 'package:ovida/src/features/notifications/data/models/notification_model.dart';
import 'package:ovida/src/features/notifications/presentation/viewmodel/notifications_viewmodel.dart';
import 'package:ovida/src/features/notifications/presentation/widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = di.get<NotificationsViewmodel>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'.hardCoded),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
            vertical: 24.h,
          ),
          child: ListenableBuilder(
              listenable: viewmodel,
              builder: (context, _) {
                if (viewmodel.isLoading) {
                  return const LoadingWidget();
                }

                if (viewmodel.error != null) {
                  return CustomErrorWidget(
                    error: viewmodel.error!,
                    onRetry: viewmodel.getNotifications,
                  );
                }

                final notifications = viewmodel.notifications;
                if (notifications == null || notifications.isEmpty) {
                  return Center(
                    child: Text('No notifications yet'.hardCoded),
                  );
                }

                return RefreshIndicator(
                  onRefresh: viewmodel.getNotifications,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 6.h),
                    itemCount: viewmodel.notifications?.length ?? 0,
                    itemBuilder: (context, index) {
                      // return NotificationCard(
                      //   notification: notifications[index],
                      // );
                      return Container(
                          padding: EdgeInsets.all(20.sp),
                          decoration: BoxDecoration(
                            color: AppColors.sectionsBackground,
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewmodel.notifications![index].title,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                viewmodel.notifications![index].message,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ));
                    },
                  ),
                );
              }),
        ));
  }
}
