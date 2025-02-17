import 'package:another_flushbar/flushbar.dart';

import '../../../../core/services/injectables/locator.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../router/rourter.dart';
import 'custom_snack_bar.dart';

Future mySnackBar(String message,
    {bool error = false, bool success = false, bool alert = true}) async {
  final context = locator<AppRouter>().navigatorKey.currentContext!;
  success
      ? CustomSnackBar.show(context,
          snackBarType: SnackBarType.success,
          backgroundColor: AppColors.darkBackroundContinarColor,
          label: message,
          behavior: SnackBarBehavior.floating,
          position: SnackBarPosition.bottom,
          iconColor: AppColors.successColor)
      : error
          ? CustomSnackBar.show(context,
              snackBarType: SnackBarType.fail,
              label: message,
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppColors.darkBackroundContinarColor,
              position: SnackBarPosition.bottom,
              iconColor: AppColors.warningColor)
          : CustomSnackBar.show(context,
              snackBarType: SnackBarType.alert,
              label: message,
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppColors.darkBackroundContinarColor,
              position: SnackBarPosition.bottom,
              iconColor: AppColors.mainColor);
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
