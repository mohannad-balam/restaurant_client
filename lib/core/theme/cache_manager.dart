import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FontCacheManager extends CacheManager {
  static const key = 'customFontCache';
  static FontCacheManager? _instance;

  factory FontCacheManager() {
    _instance ??= FontCacheManager._();
    return _instance!;
  }

  FontCacheManager._()
      : super(
          Config(
            key,
            stalePeriod: const Duration(days: 7),
            maxNrOfCacheObjects: 20,
          ),
        );
}

String getFontUrl(String fontName) {
  return 'https://fonts.googleapis.com/css2?family=$fontName&display=swap';
}

Future<TextTheme> getCachedGoogleFontTextTheme(String fontName) async {
  final fontCacheManager = FontCacheManager();
  final fontUrl = getFontUrl(fontName);

  final fileInfo = await fontCacheManager.getFileFromCache(fontUrl);
  if (fileInfo != null && await fileInfo.file.exists()) {
    final ByteData byteData = ByteData.view(await fileInfo.file.readAsBytes().then((bytes) => bytes.buffer));
    final fontLoader = FontLoader(fontName)
      ..addFont(Future.value(byteData));
    await fontLoader.load();
    return TextTheme(
      bodyLarge: TextStyle(fontFamily: fontName),
      bodyMedium: TextStyle(fontFamily: fontName),
      // Add other text styles as needed
    );
  } else {
    return getTextThemeFromGoogleFonts(fontName);
  }
}

TextTheme getTextThemeFromGoogleFonts(String fontName) {
  switch (fontName) {
    case 'BalooBhai2':
      return GoogleFonts.balooBhai2TextTheme();
    case 'Cairo':
      return GoogleFonts.cairoTextTheme();
    default:
      return GoogleFonts.cairoTextTheme();
  }
}