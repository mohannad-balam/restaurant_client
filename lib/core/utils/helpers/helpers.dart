// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/enums/platforms.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../presentation/router/rourter.dart';
import '../../services/injectables/locator.dart';

extension DoubleExtension on num {
  num toPrecision(int fractionDigits) {
    num mod = pow(10.0, fractionDigits);
    return ((this * mod).round().toDouble() / mod);
  }

  num toFourDecimals() {
    return toPrecision(4);
  }
}

class HelpUtils {
  /*
   * IDs
  */
  static late String xRequestId;
  /*
   * End IDs
  */
  static DateTime lastDate(int day) => DateTime.now().add(Duration(days: day));

  static final formatCurrency = NumberFormat.currency();
  static const _uuid = Uuid();
  static BuildContext getContext() {
    return locator<AppRouter>().navigatorKey.currentContext!;
  }

  static double parseCurrency(String value) {
    final numberString = value.replaceAll("٫", ".");
    return double.parse(numberString);
  }

  static int generateRandomInteger(int length) {
    var rng = Random();
    String value = '';
    for (int i = 0; i < length; i++) {
      value += rng.nextInt(10).toString();
    }
    return int.parse(value);
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

  static DateTime beforeMonth(
      {required int month, required DateTime dateTime}) {
    final DateTime newDateTime = DateTime(dateTime.year, dateTime.month - month,
        dateTime.day, dateTime.hour, dateTime.minute);
    return newDateTime;
  }

  static String formatHour12(int hour, int minute,
      {bool includeMinutes = false, bool showLeadingZero = false}) {
    final isPm = hour >= 12;
    final twelveHourHour = isPm ? (hour - 12) % 12 : hour;
    final formattedHour = showLeadingZero
        ? twelveHourHour.toString().padLeft(2, '0')
        : twelveHourHour.toString();
    final minutes = includeMinutes ? minute.toString().padLeft(2, '0') : '';
    final meridian = isPm ? 'PM' : 'AM';
    return '$formattedHour${includeMinutes ? ':$minutes' : ''} $meridian';
  }

  static Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? id;
    if (kIsWeb) {
      id = _uuid.v4();
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfo.androidInfo;
      id = info.id;
      // Unique ID on Android
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfo.iosInfo;
      id = info.identifierForVendor;
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo info = await deviceInfo.macOsInfo;
      id = info.systemGUID;
    } else if (Platform.isLinux) {
      LinuxDeviceInfo info = await deviceInfo.linuxInfo;
      id = info.machineId;
    } else if (Platform.isWindows) {
      WindowsDeviceInfo info = await deviceInfo.windowsInfo;
      id = info.deviceId;
    }

    return id ?? '';
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

  // static bool findRole({required String role}) {
  //   try {
  //     String a = locator<LocalDBService>()
  //             .getUser()
  //             ?.role
  //             ?.firstWhere((e) => e == role, orElse: () => "") ??
  //         '';
  //     if (kDebugMode) {
  //       print("current role ===> $a");
  //     }
  //     return a == role;
  //   } catch (e) {
  //     return false;
  //   }
  // }

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
