import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();
  final _themeKey = 'theme_mode';

  bool get isDarkMode => _box.read(_themeKey) ?? false;

  Future<void> saveThemeMode(bool isDarkMode) async {
    await _box.write(_themeKey, isDarkMode);
  }
}
