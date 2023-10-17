import 'package:hive/hive.dart';
import 'package:trilhaapp/models/tasks_hive_model.dart';

class TasksHiveRepository {
  static late Box _box;
  final KEY_TASKS = "key_tasks";

  TasksHiveRepository._create();

  static Future<TasksHiveRepository> load() async {
    if (Hive.isBoxOpen("key_tasks")) {
      _box = Hive.box("key_tasks");
    } else {
      _box = await Hive.openBox("key_tasks");
    }

    return TasksHiveRepository._create();
  }

  save(TasksHiveModel tasksHiveModel) {
    _box.add(tasksHiveModel);
  }

  alterar(TasksHiveModel tasksHiveModel) {
    tasksHiveModel.save();
  }

  excluir(TasksHiveModel tasksHiveModel) {
    tasksHiveModel.delete();
  }

  List<TasksHiveModel> obterDados(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TasksHiveModel>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TasksHiveModel>().toList();
  }
}
