import 'package:anubandhit/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: AppColors.orange,
      fontFamily: 'RedHat',
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light(primary: AppColors.orange));
}
