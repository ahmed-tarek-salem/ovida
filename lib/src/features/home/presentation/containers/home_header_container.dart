part of 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

class _HomeHeaderContainer extends StatefulWidget {
  const _HomeHeaderContainer();

  @override
  State<_HomeHeaderContainer> createState() => _HomeHeaderContainerState();
}

class _HomeHeaderContainerState extends State<_HomeHeaderContainer> {
  final userViewmodel = di<UserInfoViewmodel>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: userViewmodel,
        builder: (context, child) {
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
                    userViewmodel.userInfo?.user.firstName ?? 'Guest',
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NotificationsScreen();
                  }));
                },
                icon: SvgPicture.asset(
                  AppIcons.notifications,
                  height: 32.r,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProfileScreen();
                  }));
                },
                icon: Container(
                  width: 32.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.primaryGradient),
                  child: Center(
                    child: Text(
                      userViewmodel.userInfo?.user.firstName == null
                          ? "G"
                          : userViewmodel.userInfo!.user.firstName!
                              .substring(0, 1),
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
        });
  }
}
