import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/custom_progress_indicator.dart';
import 'package:ovida/src/core/shared/widgets/gradient_elevated_button.dart';
import 'package:ovida/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/widgets/stepper.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen();

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final viewmodel = di<UserInfoViewmodel>();
  final userViewmodel = di<AuthViewmodel>();

  @override
  void initState() {
    viewmodel.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
          ),
          child: FormBuilder(
            key: viewmodel.formKey,
            child: Column(
              children: [
                ListenableBuilder(
                    listenable: viewmodel,
                    builder: (context, widget) {
                      return CustomStepper(currentIndex: viewmodel.pageIndex);
                    }),
                SizedBox(height: 24.h),
                Expanded(
                  child: ListenableBuilder(
                      listenable: viewmodel,
                      builder: (context, widget) {
                        if (viewmodel.isLoading) {
                          return const Center(
                            child: CustomProgressIndicator(),
                          );
                        }
                        return PageView.builder(
                          itemCount: 5,
                          onPageChanged: (index) {
                            viewmodel.updatePageIndex(index);
                          },
                          itemBuilder: (context, index) {
                            return viewmodel.containers[viewmodel.pageIndex];
                          },
                        );
                      }),
                ),
                ListenableBuilder(
                    listenable: viewmodel,
                    builder: (context, widget) {
                      return Row(
                        children: [
                          if (viewmodel.pageIndex != 0)
                            InkWell(
                              onTap: () {
                                viewmodel
                                    .updatePageIndex(viewmodel.pageIndex - 1);
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
                              if (viewmodel.pageIndex <= 4) {
                                viewmodel
                                    .updatePageIndex(viewmodel.pageIndex + 1);
                              } else {
                                viewmodel.submitForm(context);
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return const HomeScreen();
                                // }));
                              }
                            },
                            child: SvgPicture.asset(
                              AppIcons.arrowForward,
                              height: 20.h,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
