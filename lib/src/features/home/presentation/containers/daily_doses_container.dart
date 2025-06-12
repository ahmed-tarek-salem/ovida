part of 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

class _DailyDoses extends StatelessWidget {
  final List<Dose> previousDoses;
  final HomeViewmodel viewmodel;

  const _DailyDoses({
    required this.previousDoses,
    required this.viewmodel,
  });

  @override
  Widget build(BuildContext context) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final yesterdayDoses = previousDoses.where((dose) {
      final doseDate = dose.notificationTime;
      return doseDate != null &&
          doseDate.year == yesterday.year &&
          doseDate.month == yesterday.month &&
          doseDate.day == yesterday.day;
    }).toList();
    final numberOfDoses = yesterdayDoses.length;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.sectionsBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yesterday\'s Doses',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return const DailyDosesScreen();
              //     }));
              //   },
              //   child: Row(
              //     children: [
              //       Text(
              //         'view all',
              //         style: TextStyle(
              //           fontSize: 10.sp,
              //           color: AppColors.primary,
              //         ),
              //       ),
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         size: 12.r,
              //         color: AppColors.primary,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 16.h),
          if (viewmodel.isLoading)
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: CircularProgressIndicator(),
            )),
          if (!viewmodel.isLoading)
            ...List.generate(
              numberOfDoses,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    final dose = yesterdayDoses[index];
                    showDialog(
                      context: context,
                      builder: (context) =>
                          DrugInfoDialog(medication: dose.medication),
                    );
                  },
                  child: DoseTile(
                    time: yesterdayDoses[index].notificationTime!,
                    medicine: yesterdayDoses[index]
                            .medication
                            ?.medicationDetails
                            ?.brandName ??
                        '',
                    withOutDivider: index == numberOfDoses,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
