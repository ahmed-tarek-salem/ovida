part of 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

class _UpcomingDoseContainer extends StatelessWidget {
  final Dose? upcomingDose;
  final Function(String id)? onTakeDose;
  final Function(String id)? onSkipDose;
  final Function(String id, DateTime time)? onSnoozeDose;
  final HomeViewmodel viewmodel;
  const _UpcomingDoseContainer({
    required this.upcomingDose,
    required this.onTakeDose,
    required this.onSkipDose,
    required this.onSnoozeDose,
    required this.viewmodel,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('hh:mma')
        .format(upcomingDose?.notificationTime ?? DateTime.now())
        .toLowerCase();
    int getElapsedMinutes(DateTime start, DateTime end) {
      return end.difference(start).inMinutes.abs();
    }

    final doseDistance =
        upcomingDose?.medication?.frequency == "foure-times-daily"
            ? 6
            : upcomingDose?.medication?.frequency == "three-times-daily"
                ? 8
                : upcomingDose?.medication?.frequency == "twice-daily"
                    ? 12
                    : 24;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.sectionsBackground,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Dose!',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (viewmodel.isLoading)
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: CircularProgressIndicator(),
            )),
          if (!viewmodel.isLoading) ...[
            Text(
                upcomingDose?.notificationTime == null
                    ? "You have no upcoming doses"
                    : 'Your next dose of ${upcomingDose!.medication?.medicationDetails?.brandName ?? ''} at $formattedTime ',
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 16.h),
            if (upcomingDose?.notificationTime != null)
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          BorderedButtonWithIcon(
                            height: 36.h,
                            width: 74.w,
                            text: "Take",
                            iconPath: AppIcons.take,
                            onPressed: () {
                              onTakeDose?.call(upcomingDose!.id!);
                            },
                          ),
                          SizedBox(width: 8.w),
                          BorderedButtonWithIcon(
                            height: 36.h,
                            width: 74.w,
                            text: "Skip",
                            iconPath: AppIcons.skip,
                            onPressed: () {
                              onSkipDose?.call(upcomingDose!.id!);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      BorderedButtonWithIcon(
                        height: 36.h,
                        width: 154.w,
                        text: "Snooze for 10 mins",
                        iconPath: AppIcons.snooze,
                        onPressed: () {
                          onSnoozeDose?.call(upcomingDose!.id!,
                              upcomingDose!.notificationTime!);
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  GradientTimerWidget(
                    totalMinutes: doseDistance * 60,
                    remainingMinutes: getElapsedMinutes(
                        DateTime.now(), upcomingDose!.notificationTime!),
                    gradientColors: const [
                      Color(0xFFB8A6FF),
                      Color(0xFF8B7CFF)
                    ], // Purple gradient
                    strokeWidth: 8.0,
                  ),
                ],
              ),
          ]
        ],
      ),
    );
  }
}
