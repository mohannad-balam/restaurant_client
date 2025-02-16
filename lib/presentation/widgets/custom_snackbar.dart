import 'package:another_flushbar/flushbar.dart';
import '../../../../core/services/injectables/locator.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../router/rourter.dart';

Future mySnackBar(
  String message,
  bool isSuccess,
) async {
  final context = locator<AppRouter>().navigatorKey.currentContext!;
  final currentTheme = Theme.of(context);
  Flushbar(
    message: message,
    icon: Icon(
      isSuccess ? Icons.check_sharp : Icons.warning_amber_rounded,
      size: 28.0,
      color: AppColors.mainColor,
    ),
    margin: const EdgeInsets.all(6.0),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    textDirection: Directionality.of(context),
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor:
        isSuccess ? AppColors.successColor : currentTheme.colorScheme.error,
  ).show(context);
}

Future mySnackBarBack(String message) async {
  final context = locator<AppRouter>().navigatorKey.currentContext!;
  // final currentTheme = Theme.of(context);
  Flushbar(
    message: message,
    // icon: Icon(
    //   isSuccess ?Icons.check_sharp:Icons.warning_amber_rounded,
    //   size: 28.0,
    //   color: AppColors.mainColor,
    // ),
    margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 70),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.BOTTOM,
    textDirection: Directionality.of(context),
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 2),
    // leftBarIndicatorColor: currentTheme.colorScheme.primary,
  ).show(context);
}
