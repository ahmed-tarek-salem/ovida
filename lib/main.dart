import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

import 'src/core/constants/app_theme.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

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
          home: const HomeScreen(),
        );
      }),
    );
  }
}
