import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class AppColors {
  static final primary = HexColor('#374151');
  static final secondary = HexColor('#64748B');
  static final sectionsBackground = HexColor('#E5EAFF');

  static final Color gradientStart = HexColor('#A5B4FC');
  static final Color gradientEnd = HexColor('#D8B4FE');

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xffA5B4FC),
      Color(0xffD8B4FE),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final onSurface = HexColor('#1C1B1F');
  static final blueLink = HexColor('#5498EB');
  static final error = HexColor('#EF0000');
  static final lightGrey = HexColor('#ACACAC');
  static final lightRed = HexColor('FEEEEE');
  static const Color green = Color(0xff0EA453);
  static const Color red = Color(0xffF74848);
  static final Color backgroundLightRed = HexColor('FFECED');
  static const Color greyColor = Color(0xff7E7E7E);
  static const Color lightGreyColor = Color(0xffECECEC);
  static const Color veryLightColor = Color(0xffF9F9F9);
  static final Color sucessColor = HexColor('#0EA453');
  static final Color sucessBackgroundColor = HexColor('#ECF8F2');
}
