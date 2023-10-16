import 'package:hive/hive.dart';
import 'package:trilhaapp/models/registration_data.dart';

class RegistrationDataRepository {
  static late Box _box;
  final KEY_REGISTRATION_DATA = "registration_data";

  RegistrationDataRepository._create();

  static Future<RegistrationDataRepository> load() async {
    if (Hive.isBoxOpen("registration_data")) {
      _box = Hive.box("registration_data");
    } else {
      _box = await Hive.openBox("registration_data");
    }

    return RegistrationDataRepository._create();
  }

  save(RegistrationDataModel registration_data) {
    _box.put("registration_data", registration_data);
  }

  RegistrationDataModel obterDados() {
    var registration_data = _box.get("registration_data");
    if (registration_data == null) {
      return RegistrationDataModel.vazio();
    } else {
      return registration_data;
    }
  }
}
