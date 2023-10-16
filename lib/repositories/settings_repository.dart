import 'package:hive/hive.dart';
import 'package:trilhaapp/models/settings_model.dart';

class SettingsRepository {
  static late Box _box;

  SettingsRepository._create();

  static Future<SettingsRepository> load() async {
    if (Hive.isBoxOpen("settings")) {
      _box = Hive.box('settings');
    } else {
      _box = await Hive.openBox('settings');
    }

    return SettingsRepository._create();
  }

  void save(SettingsModel settingsModel) {
    _box.put("settingsModel", {
      "nickname": settingsModel.nickname,
      "email": settingsModel.email,
      "receiveNotification": settingsModel.receiveNotification,
      "darkMode": settingsModel.darkMode,
    });
  }

  SettingsModel obterDados() {
    var settings = _box.get("settingsModel");
    if (settings == null) return SettingsModel.vazio();
    return SettingsModel(
      settings["nickname"],
      settings["email"],
      settings["receiveNotification"],
      settings["darkMode"],
    );
  }
}
