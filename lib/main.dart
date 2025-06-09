import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:ovida/firebase_options.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/utilities/notifications_helper.dart';
import 'package:ovida/src/features/auth/presentation/view/screens/auth_screen.dart';

import 'src/core/constants/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.instance.initialize();

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
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'OVIDA',
          debugShowCheckedModeBanner: false,
          theme: createTheme(),
          home: const AuthScreen(),
          builder: (context, child) {
            child = FlutterSmartDialog.init()(context, child);
            return child;
          },
        );
      }),
    );
  }
}
