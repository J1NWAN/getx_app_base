import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();
  final _themeKey = 'theme_mode';
  static const LOCALE_KEY = 'locale';

  bool get isDarkMode => _box.read(_themeKey) ?? false;

  Future<void> saveThemeMode(bool isDarkMode) async {
    await _box.write(_themeKey, isDarkMode);
  }

  String? get locale => _box.read(LOCALE_KEY);

  Future<void> saveLocale(String locale) async {
    await _box.write(LOCALE_KEY, locale);
  }
}
