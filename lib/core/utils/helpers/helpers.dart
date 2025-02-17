// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/enums/platforms.dart';
import 'package:intl/intl.dart';

import '../../../presentation/router/rourter.dart';
import '../../services/injectables/locator.dart';

class HelpUtils {
  static BuildContext getContext() {
    return locator<AppRouter>().navigatorKey.currentContext!;
  }

  static String format_Y_M_D(DateTime dateTime) =>
      DateFormat('yyyy-MM-dd').format(dateTime);

  static String format_Y_M_D_containing_hours(DateTime dateTime) {
    if (kDebugMode) {
      print(dateTime.toString().split(".")[0]);
    }
    return dateTime.toString().split(".")[0];
  }

  static String formatUTCDateTime(DateTime dateTime) {
    String formatted;
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd : hh:mm a');
      DateTime dateTimeWithZone = dateTime.add(DateTime.now().timeZoneOffset);
      formatted = formatter.format(dateTimeWithZone);
    } catch (e) {
      formatted = '';
    }

    return formatted;
  }

  static bool checkPlatform(List<PlatformsEnum> platforms) {
    if (!platforms.contains(PlatformsEnum.Web)) {
      if (kIsWeb) {
        return false;
      }
    }
    for (final item in platforms) {
      if (item == PlatformsEnum.Web && kIsWeb) {
        return true;
      }

      if (item == PlatformsEnum.Android && Platform.isAndroid) {
        return true;
      }
      if (item == PlatformsEnum.IOS && Platform.isIOS) {
        return true;
      }
      if (item == PlatformsEnum.Linux && Platform.isLinux) {
        return true;
      }
      if (item == PlatformsEnum.MacOS && Platform.isMacOS) {
        return true;
      }
      if (item == PlatformsEnum.Windows && Platform.isWindows) {
        return true;
      }
    }
    return false;
  }

  static void tryLaunch({String? url}) {
    try {
      launchUrl(Uri.parse(url ?? ''));
    } catch (e) {
      if (kDebugMode) {
        print("couldn't launch url =====> $url");
      }
    }
  }

  static String urlLastSegment(String url) {
    final uri = Uri.parse(url);
    return uri.pathSegments.last;
  }
}
