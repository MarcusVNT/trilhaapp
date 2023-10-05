import 'package:trilhaapp/models/tasks.dart';

class TasksRepository {
  final List<Tasks> _tasks = [];

  void adicionar(Tasks task) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.add(task);
  }

  void alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.where((task) => task.getId() == id).first.setConcluido(concluido);
  }

  Future<List<Tasks>> listarTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }
}
