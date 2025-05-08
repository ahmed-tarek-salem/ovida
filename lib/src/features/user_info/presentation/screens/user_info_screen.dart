import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';
import 'package:ovida/src/features/home/presentation/screens/home_screen.dart';
import 'package:ovida/src/features/user_info/presentation/cubit/user_info_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserInfoCubit(),
      child: _UserInfoScreen(),
    );
  }
}

class _UserInfoScreen extends StatelessWidget {
  const _UserInfoScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
          ),
          child: BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              final currentIndex =
                  state is UserInfoUpdated ? state.currentIndex : 0;
              return Column(
                children: [
                  Stepper(currentIndex: currentIndex),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: PageView.builder(
                      itemCount: 5,
                      onPageChanged: (index) {
                        context.read<UserInfoCubit>().updatePageIndex(index);
                      },
                      itemBuilder: (context, index) {
                        return context
                            .read<UserInfoCubit>()
                            .containers[currentIndex];
                      },
                    ),
                  ),
                  Row(
                    children: [
                      if (currentIndex != 0)
                        InkWell(
                          onTap: () {
                            context
                                .read<UserInfoCubit>()
                                .updatePageIndex(currentIndex - 1);
                          },
                          borderRadius: BorderRadius.circular(50.sp),
                          child: Container(
                            width: 50.sp,
                            height: 50.sp,
                            decoration: BoxDecoration(
                                border: GradientBoxBorder(
                                  gradient: AppColors.primaryGradient,
                                  width: 2.sp,
                                ),
                                borderRadius: BorderRadius.circular(50.sp)),
                            child: Center(
                              child: SvgPicture.asset(
                                AppIcons.arrowBack,
                                height: 20.h,
                              ),
                            ),
                          ),
                        ),
                      Spacer(),
                      GradientButton(
                        height: 50.sp,
                        width: 50.sp,
                        borderRadius: 50.sp,
                        onPressed: () {
                          if (currentIndex <= 4) {
                            context
                                .read<UserInfoCubit>()
                                .updatePageIndex(currentIndex + 1);
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }));
                          }
                        },
                        child: SvgPicture.asset(
                          AppIcons.arrowForward,
                          height: 20.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Stepper extends StatelessWidget {
  final int currentIndex;

  const Stepper({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                color:
                    index <= currentIndex ? null : AppColors.sectionsBackground,
                gradient:
                    index <= currentIndex ? AppColors.primaryGradient : null,
              ),
            ),
          ),
        );
      }),
    );
  }
}
