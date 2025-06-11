part of 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

class _DailyDoses extends StatelessWidget {
  final List<Dose> previousDoses;
  final Function(String id)? onTakeDose;
  final Function(String id)? onSkipDose;
  final Function(String id)? onSnoozeDose;

  const _DailyDoses({
    required this.previousDoses,
    required this.onTakeDose,
    required this.onSkipDose,
    required this.onSnoozeDose,
  });

  @override
  Widget build(BuildContext context) {
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
            10,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => DrugInfoDialog(),
                  );
                },
                child: DoseTile(
                  withOutDivider: index == 9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
