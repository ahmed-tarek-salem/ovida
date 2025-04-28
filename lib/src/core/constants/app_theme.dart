import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ovida/src/core/constants/app_colors.dart';

import 'app_constants.dart';

ThemeData createTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
      circularTrackColor: Colors.white,
      linearTrackColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        iconSize: 28),
    //fontFamily: ThemeViewmodel.i.fontFamily,
    dialogBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        toolbarHeight: 48,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        surfaceTintColor: AppColors.primary,
        backgroundColor: AppColors.primary),
    dividerColor: Colors.black.withOpacity(0.05),
    dividerTheme: DividerThemeData(
      color: HexColor('#E6E6E6'),
      thickness: 1,
    ),
    primarySwatch: MaterialColor(
      AppColors.primary.value,
      {
        50: AppColors.primary,
        100: AppColors.primary,
        200: AppColors.primary,
        300: AppColors.primary,
        400: AppColors.primary,
        500: AppColors.primary,
        600: AppColors.primary,
        700: AppColors.primary,
        800: AppColors.primary,
        900: AppColors.primary,
      },
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.onSurface),
      bodySmall: TextStyle(fontSize: 14, color: AppColors.onSurface),
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontFamily: FontFamily.readexPro,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.raduis),
        ),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: FontFamily.readexPro,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        side: BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
        foregroundColor: AppColors.primary,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.raduis),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(
          fontFamily: FontFamily.readexPro,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    visualDensity: VisualDensity.compact,
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(width: 1, color: HexColor('#575757')),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 10,
      border: GradientOutlineInputBorder(gradient: AppColors.primaryGradient),
      focusedBorder:
          GradientOutlineInputBorder(gradient: AppColors.primaryGradient),
      enabledBorder: GradientOutlineInputBorder(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppConstants.raduis)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class FontFamily {
  FontFamily._();

  static const String iBMPlexSansArabic = 'IBMPlexSansArabic';
  static const String montserratArabic = 'Montserrat-Arabic';
  static const String readexPro = 'ReadexPro';
}
