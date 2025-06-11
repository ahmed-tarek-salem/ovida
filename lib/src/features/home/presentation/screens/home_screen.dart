import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:ovida/src/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:ovida/src/features/profile/presentation/screens/profile_screen.dart';

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

  @override
  void initState() {
    super.initState();
    viewmodel.getDoses();
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
                    return ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.horizontalPadding,
                      ),
                      children: [
                        SizedBox(height: 16.h),
                        _HomeHeaderContainer(),
                        SizedBox(height: 24.h),
                        _UpcomingDoseContainer(
                            upcomingDose: viewmodel.doses?.nextDose),
                        SizedBox(height: 24.h),
                        _DailyDoses(
                          previousDoses: viewmodel.doses?.previousDoses ?? [],
                          onTakeDose: (doseId) => viewmodel.takeDose(doseId),
                          onSkipDose: (doseId) => viewmodel.skipDose(doseId),
                          onSnoozeDose: (doseId) =>
                              viewmodel.snoozeDose(doseId, 10),
                        ),
                        SizedBox(height: 24.h),
                      ],
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
