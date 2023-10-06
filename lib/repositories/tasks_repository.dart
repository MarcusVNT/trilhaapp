import 'package:trilhaapp/models/tasks.dart';

class TasksRepository {
  final List<Tasks> _tasks = [];

  Future<void> adicionar(Tasks task) async {
    await Future.delayed(const Duration(milliseconds: 1));
    _tasks.add(task);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 1));
    _tasks.where((task) => task.id == id).first.concluido = concluido;
  }

  Future<List<Tasks>> listarTasks() async {
    await Future.delayed(const Duration(milliseconds: 1));
    return _tasks;
  }

  Future<List<Tasks>> listarNaoConcluidas() async {
    await Future.delayed(const Duration(milliseconds: 1));
    return _tasks.where((task) => !task.concluido).toList();
  }

  Future<void> remove(
    String id,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1));
    _tasks.remove(_tasks.where((task) => task.id == id).first);
  }
}
