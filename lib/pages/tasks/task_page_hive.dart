import 'package:flutter/material.dart';

import 'package:trilhaapp/models/tasks_hive_model.dart';
import 'package:trilhaapp/repositories/tasks_hive_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var _tasks = const <TasksHiveModel>[];
  late TasksHiveRepository tasksRepository;
  var descricaoController = TextEditingController();
  var tasksNaoConcluidas = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTasks();
  }

  void obterTasks() async {
    tasksRepository = await TasksHiveRepository.load();

    _tasks = tasksRepository.obterDados(tasksNaoConcluidas);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(46, 82, 83, 1),
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      labelText: "Descrição",
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          await tasksRepository.save(TasksHiveModel.create(
                              descricaoController.text, false));

                          obterTasks();
                          setState(() {});
                        },
                        child: const Text("Adicionar")),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(46, 82, 83, 1),
          title: const Text("Tarefas")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não Concluídos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                      value: tasksNaoConcluidas,
                      onChanged: (bool value) {
                        tasksNaoConcluidas = value;
                        obterTasks();
                        setState(() {});
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (BuildContext bc, int index) {
                  var task = _tasks[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      tasksRepository.excluir(task);

                      obterTasks();
                    },
                    key: Key(task.descricao),
                    child: ListTile(
                      title: Text(task.descricao),
                      trailing: Switch(
                        onChanged: (bool value) async {
                          task.concluido = value;
                          tasksRepository.alterar(task);
                          obterTasks();
                        },
                        value: task.concluido,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
