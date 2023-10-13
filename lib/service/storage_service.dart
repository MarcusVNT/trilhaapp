import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  KEY_NAME_DATA,
  KEY_BIRTH_DATE_DATA,
  KEY_LEVEL_DATA,
  KEY_LANGUAGES_DATA,
  KEY_TIME_EXPERIENCE_DATA,
  KEY_CHOSEN_SALARY_DATA,
}

class StorageService {
  _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? "";
  }

  _setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0.0;
  }

  _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }

  void setRegistrationDataName(String name) async {
    _setString(STORAGE_KEYS.KEY_NAME_DATA.toString(), name);
  }

  Future<String> getRegistrationDataName() async {
    return _getString(STORAGE_KEYS.KEY_NAME_DATA.toString());
  }

  void setRegistrationDataBirthDate(DateTime value) async {
    _setString(STORAGE_KEYS.KEY_BIRTH_DATE_DATA.toString(), value.toString());
  }

  Future<String> getRegistrationDataBirthDate() async {
    return _getString(STORAGE_KEYS.KEY_BIRTH_DATE_DATA.toString());
  }

  void setRegistrationDataLevel(String value) async {
    _setString(STORAGE_KEYS.KEY_LEVEL_DATA.toString(), value);
  }

  Future<String> getRegistrationDataLevel() async {
    return _getString(STORAGE_KEYS.KEY_LEVEL_DATA.toString());
  }

  void setRegistrationDataLanguages(List<String> values) async {
    _setStringList(STORAGE_KEYS.KEY_LANGUAGES_DATA.toString(), values);
  }

  Future<List<String>> getRegistrationDataLanguages() async {
    return _getStringList(STORAGE_KEYS.KEY_LANGUAGES_DATA.toString());
  }

  void setRegistrationDataTimeExperience(int value) async {
    _setInt(STORAGE_KEYS.KEY_TIME_EXPERIENCE_DATA.toString(), value);
  }

  Future<int> getRegistrationDataTimeExperience() async {
    return _getInt(STORAGE_KEYS.KEY_TIME_EXPERIENCE_DATA.toString());
  }

  void setRegistrationDataChosenSalary(double value) async {
    _setDouble(STORAGE_KEYS.KEY_CHOSEN_SALARY_DATA.toString(), value);
  }

  Future<double> getRegistrationDataChosenSalary() async {
    return _getDouble(STORAGE_KEYS.KEY_CHOSEN_SALARY_DATA.toString());
  }
}
