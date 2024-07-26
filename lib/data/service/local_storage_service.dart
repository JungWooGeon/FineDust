import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  SharedPreferences? _prefs;
  static const String lastUpdateDateTimeKey = "LastUpdateDateTimeKey";

  LocalStorageService();

  Future<void> _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setLastUpdateDateTime(String value) async {
    await _init();
    await _prefs?.setString(lastUpdateDateTimeKey, value);
  }

  Future<String?> getLastUpdateDateTime() async {
    await _init();
    return _prefs?.getString(lastUpdateDateTimeKey);
  }
}