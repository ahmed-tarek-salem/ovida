part of 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

class _DailyDoses extends StatelessWidget {
  final List<Dose> previousDoses;

  const _DailyDoses({
    required this.previousDoses,
  });

  @override
  Widget build(BuildContext context) {
    final numberOfDoses = min(previousDoses.length, 10);
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
                'Daily Doses',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DailyDosesScreen();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      'view all',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.primary,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.r,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...List.generate(
            numberOfDoses,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  final dose = previousDoses[index];
                  showDialog(
                    context: context,
                    builder: (context) =>
                        DrugInfoDialog(medication: dose.medication),
                  );
                },
                child: DoseTile(
                  time: previousDoses[index].notificationTime!,
                  medicine: previousDoses[index]
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
