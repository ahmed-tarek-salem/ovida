import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/features/auth/presentation/view/screens/auth_screen.dart';

import 'src/core/constants/app_theme.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  DiService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'OVIDA',
        debugShowCheckedModeBanner: false,
        theme: createTheme(),
        home: const AuthScreen(),
        builder: (context, child) {
          child = FlutterSmartDialog.init()(context, child);
          return child;
        },
      ),
    );
  }
}
