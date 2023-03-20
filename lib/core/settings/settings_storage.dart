import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldofword/core/settings/theme.dart';

abstract class Keys {
  static const String themeKey = 'theme';
  static const String fontSizeKey = 'font_size';
  static const String localeKey = 'locale';
}

@Injectable()
class SettingsStorage {
  static late SharedPreferences storage;

  static Future<dynamic> init() async {
    storage = await SharedPreferences.getInstance();
  }

  static String readTheme() {
    final theme = storage.getString(Keys.themeKey);
    return theme ?? ThemeEnam().themeColorFromEnum(AppTheme.light);
  }

  static Future<dynamic> setTheme(String theme) async {
    await storage.setString(Keys.themeKey, theme);
  }

  static double readFontSize() {
    final fontSize = storage.getDouble(Keys.fontSizeKey);
    return fontSize ?? 20;
  }

  static Future<dynamic> setFontSize(double fontSize) async {
    await storage.setDouble(Keys.fontSizeKey, fontSize);
  }

  static String readLocale() {
    final locale = storage.getString(Keys.localeKey);
    return locale ?? 'en';
  }

  static Future<dynamic> setLocale(String locale) async {
    await storage.setString(Keys.localeKey, locale);
  }
}
