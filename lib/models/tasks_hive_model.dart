import 'package:hive/hive.dart';
part 'tasks_hive_model.g.dart';

@HiveType(typeId: 1)
class TasksHiveModel extends HiveObject {
  @HiveField(0)
  String descricao = "";
  @HiveField(1)
  bool concluido = false;

  TasksHiveModel();

  TasksHiveModel.create(this.descricao, this.concluido);
}
