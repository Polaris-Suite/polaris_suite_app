import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';

class AppTextStyle {
  static const textH1 = TextStyle(
    fontFamily: 'QuickSand',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.neutralDark,
  );
  static const textH2 = TextStyle(
    fontFamily: 'QuickSand',
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.neutralDark,
  );
  static const textH3 = TextStyle(
    fontFamily: 'QuickSand',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.neutralDark,
  );
  static const textH6 = TextStyle(
    fontFamily: 'Sen',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.neutralDark,
  );
  static const body = TextStyle(
    fontFamily: 'Sen',
    fontSize: 14,
    color: AppColors.neutralDark,
  );
  static const bodyBlue = TextStyle(
    fontFamily: 'Sen',
    fontSize: 14,
    color: AppColors.primaryColor,
  );
}
