import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldofword/core/settings/theme.dart';

abstract class Keys {
  static const String themeKey = 'theme';
  static const String fontSizeKey = 'font_size';
}

@Injectable()
class SettingsStorage {
  static late SharedPreferences _storage;

  static Future<dynamic> init() async {
    _storage = await SharedPreferences.getInstance();
  }

  static String readTheme() {
    final storage = _storage;
    final theme = storage.getString(Keys.themeKey);
    return theme ?? ThemeEnam().themeColorFromEnum(AppTheme.light);
  }

  static Future<dynamic> setTheme(String theme) async {
    final storage = _storage;
    await storage.setString(Keys.themeKey, theme);
  }

  static double readFontSize() {
    final storage = _storage;
    final fontSize = storage.getDouble(Keys.fontSizeKey);
    return fontSize ?? 20;
  }

  static Future<dynamic> setFontSize(double fontSize) async {
    final storage = _storage;
    await storage.setDouble(Keys.fontSizeKey, fontSize);
  }
}
