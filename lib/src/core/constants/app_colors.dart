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

  static final blueLink = HexColor('#5498EB');
  static final error = HexColor('#EF0000');
  static final lightGrey = HexColor('#C4C4C4');
}
