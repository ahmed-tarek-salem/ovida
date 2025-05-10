part of 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

class _HomeHeaderContainer extends StatelessWidget {
  const _HomeHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Folan El-Folany',
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppIcons.notifications,
            height: 32.r,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Container(
            width: 32.r,
            height: 32.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle, gradient: AppColors.primaryGradient),
            child: Center(
              child: Text(
                "FA",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
