import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ovida/src/core/constants/app_colors.dart';
import 'package:ovida/src/core/constants/app_constants.dart';
import 'package:ovida/src/core/constants/app_icons.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/shared/widgets/dose_tile.dart';
import 'package:ovida/src/features/daily_doses/presentation/screens/daily_doses_screen.dart';
import 'package:ovida/src/features/home/data/models/doses_model.dart';
import 'package:ovida/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:ovida/src/features/home/presentation/widgets/add_medicine_button.dart';
import 'package:ovida/src/features/home/presentation/widgets/drug_info_dialog.dart';
import 'package:ovida/src/features/home/presentation/widgets/gradient_bordered_button_with_icon.dart';
import 'package:ovida/src/features/home/presentation/widgets/gradient_timer_widget.dart';
import 'package:ovida/src/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:ovida/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:ovida/src/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';

part '../containers/daily_doses_container.dart';
part '../containers/home_header_container.dart';
part '../containers/upcoming_dose_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewmodel = di<HomeViewmodel>();
  final userInfo = di<UserInfoViewmodel>();

  @override
  void initState() {
    super.initState();
    viewmodel.getDoses();
    userInfo.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListenableBuilder(
                  listenable: di<HomeViewmodel>(),
                  builder: (context, child) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await viewmodel.getDoses();
                      },
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.horizontalPadding,
                        ),
                        children: [
                          SizedBox(height: 16.h),
                          _HomeHeaderContainer(),
                          SizedBox(height: 24.h),
                          _UpcomingDoseContainer(
                            upcomingDose: viewmodel.doses?.nextDose,
                            onTakeDose: (doseId) => viewmodel.takeDose(doseId),
                            onSkipDose: (doseId) => viewmodel.skipDose(doseId),
                            onSnoozeDose: (doseId, time) =>
                                viewmodel.snoozeDose(doseId, time),
                            viewmodel: viewmodel,
                          ),
                          SizedBox(height: 24.h),
                          _DailyDoses(
                            viewmodel: viewmodel,
                            previousDoses: viewmodel.doses?.previousDoses ?? [],
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    );
                  }),
            ),
            AddMedicineButton(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
