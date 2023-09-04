import 'package:flutter/material.dart';
import 'package:shopilli/core/constants/app_colors.dart';
import 'package:shopilli/core/constants/app_strings.dart';

class MyAppBar {
  static PreferredSizeWidget? get appBar => AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(appName),
        centerTitle: true,
      );
}
