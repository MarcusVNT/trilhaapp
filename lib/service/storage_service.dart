import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  KEY_NAME_DATA,
  KEY_BIRTH_DATE_DATA,
  KEY_LEVEL_DATA,
  KEY_LANGUAGES_DATA,
  KEY_TIME_EXPERIENCE_DATA,
  KEY_CHOSEN_SALARY_DATA,
  KEY_NICKNAME,
  KEY_EMAIL,
  KEY_RECEIVE_NOTIFICATION,
  KEY_DARK_MODE,
}

class StorageService {
  Future<void> _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? "";
  }

  Future<void> _setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  Future<void> _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  Future<void> _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0.0;
  }

  Future<void> _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }

  Future<void> setRegistrationDataName(String value) async {
    await _setString(STORAGE_KEYS.KEY_NAME_DATA.toString(), value);
  }

  Future<String> getRegistrationDataName() async {
    return _getString(STORAGE_KEYS.KEY_NAME_DATA.toString());
  }

  Future<void> setRegistrationDataBirthDate(DateTime value) async {
    await _setString(
        STORAGE_KEYS.KEY_BIRTH_DATE_DATA.toString(), value.toString());
  }

  Future<String> getRegistrationDataBirthDate() async {
    return _getString(STORAGE_KEYS.KEY_BIRTH_DATE_DATA.toString());
  }

  Future<void> setRegistrationDataLevel(String value) async {
    await _setString(STORAGE_KEYS.KEY_LEVEL_DATA.toString(), value);
  }

  Future<String> getRegistrationDataLevel() async {
    return _getString(STORAGE_KEYS.KEY_LEVEL_DATA.toString());
  }

  Future<void> setRegistrationDataLanguages(List<String> values) async {
    await _setStringList(STORAGE_KEYS.KEY_LANGUAGES_DATA.toString(), values);
  }

  Future<List<String>> getRegistrationDataLanguages() async {
    return _getStringList(STORAGE_KEYS.KEY_LANGUAGES_DATA.toString());
  }

  Future<void> setRegistrationDataTimeExperience(int value) async {
    await _setInt(STORAGE_KEYS.KEY_TIME_EXPERIENCE_DATA.toString(), value);
  }

  Future<int> getRegistrationDataTimeExperience() async {
    return _getInt(STORAGE_KEYS.KEY_TIME_EXPERIENCE_DATA.toString());
  }

  Future<void> setRegistrationDataChosenSalary(double value) async {
    await _setDouble(STORAGE_KEYS.KEY_CHOSEN_SALARY_DATA.toString(), value);
  }

  Future<double> getRegistrationDataChosenSalary() async {
    return _getDouble(STORAGE_KEYS.KEY_CHOSEN_SALARY_DATA.toString());
  }

  Future<void> setNickname(String value) async {
    await _setString(STORAGE_KEYS.KEY_NICKNAME.toString(), value);
  }

  Future<String> getNickname() async {
    return _getString(STORAGE_KEYS.KEY_NICKNAME.toString());
  }

  Future<void> setEmail(String value) async {
    await _setString(STORAGE_KEYS.KEY_EMAIL.toString(), value);
  }

  Future<String> getEmail() async {
    return _getString(STORAGE_KEYS.KEY_EMAIL.toString());
  }

  Future<void> setReceiveNotification(bool value) async {
    await _setBool(STORAGE_KEYS.KEY_RECEIVE_NOTIFICATION.toString(), value);
  }

  Future<bool> getReceiveNotification() async {
    return _getBool(STORAGE_KEYS.KEY_RECEIVE_NOTIFICATION.toString());
  }

  Future<void> setDarkMode(bool value) async {
    await _setBool(STORAGE_KEYS.KEY_DARK_MODE.toString(), value);
  }

  Future<bool> getDarkMode() async {
    return _getBool(STORAGE_KEYS.KEY_DARK_MODE.toString());
  }
}
