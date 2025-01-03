import '../enums/theme_enum.dart';
import 'theme_mode.dart';

class AppThemes {
  static String lang = "ar";
  static ThemeEnum mode = ThemeEnum.light;
  static final themes = {
    ThemeEnum.light: getLightTheme(lang),
    ThemeEnum.dark: getDarkTheme(lang)
  };
}