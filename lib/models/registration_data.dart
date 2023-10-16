import 'package:hive/hive.dart';
part 'registration_data.g.dart';

@HiveType(typeId: 0)
class RegistrationDataModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  DateTime? birthDate;

  @HiveField(2)
  String? level;

  @HiveField(3)
  List<String> languages = [];

  @HiveField(4)
  int? timeExperience;

  @HiveField(5)
  double? chosenSalary;

  RegistrationDataModel();

  RegistrationDataModel.vazio() {
    name = "";
    birthDate = null;
    level = "";
    languages = [];
    timeExperience = 0;
    chosenSalary = 0;
  }
}
