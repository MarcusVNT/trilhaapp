import 'package:flutter/material.dart';
import 'package:trilhaapp/models/registration_data.dart';
import 'package:trilhaapp/repositories/language_repositories.dart';
import 'package:trilhaapp/repositories/level_repositories.dart';
import 'package:trilhaapp/repositories/registration_data_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class RegistrationDataHive extends StatefulWidget {
  const RegistrationDataHive({Key? key}) : super(key: key);

  @override
  State<RegistrationDataHive> createState() => _RegistrationDataHiveState();
}

class _RegistrationDataHiveState extends State<RegistrationDataHive> {
  late RegistrationDataRepository registrationDataRepository;
  var registrationDataModel = RegistrationDataModel.vazio();

  var nameController = TextEditingController(text: "");
  var birthDateController = TextEditingController(text: "");
  var levelRepository = LevelRepository();
  var levels = [];
  var languagesRepository = LanguagesRepository();
  var languages = [];
  bool saving = false;

  @override
  void initState() {
    // TODO: implement initState
    levels = levelRepository.retornaLevel();
    languages = languagesRepository.retornaLanguages();
    super.initState();
    loadData();
  }

  void loadData() async {
    registrationDataRepository = await RegistrationDataRepository.load();
    registrationDataModel = registrationDataRepository.obterDados();
    nameController.text = registrationDataModel.name ?? "";
    birthDateController.text = registrationDataModel.birthDate == null
        ? ""
        : registrationDataModel.birthDate.toString();

    setState(() {});
  }

  List<DropdownMenuItem<int>> returnsItems(int max) {
    var items = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= max; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: saving
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TextLabel(texto: "Nome"),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Digite seu nome",
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextLabel(texto: "Data de Nascimento"),
                    TextField(
                      controller: birthDateController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2024, 1, 1),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2057),
                        );
                        if (data != null) {
                          birthDateController.text =
                              "${data.day}/${data.month}/${data.year}";
                          registrationDataModel.birthDate = data;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    const TextLabel(texto: "Nível de Experiência"),
                    Column(
                        children: levels
                            .map((level) => RadioListTile(
                                title: Text(level.toString()),
                                selected: registrationDataModel.level == level,
                                value: level,
                                groupValue: registrationDataModel.level,
                                onChanged: (value) {
                                  setState(() {
                                    registrationDataModel.level =
                                        value.toString();
                                  });
                                }))
                            .toList()),
                    const SizedBox(height: 10),
                    const TextLabel(
                      texto: "Linguaguens Preferidas",
                    ),
                    Column(
                        children: languages
                            .map(
                              (languages) => CheckboxListTile(
                                title: Text(languages.toString()),
                                value: registrationDataModel.languages
                                    .contains(languages),
                                onChanged: (bool? value) {
                                  if (value!) {
                                    setState(() {
                                      registrationDataModel.languages
                                          .add(languages);
                                    });
                                  } else {
                                    setState(() {
                                      registrationDataModel.languages
                                          .remove(languages);
                                    });
                                  }
                                },
                              ),
                            )
                            .toList()),
                    const SizedBox(height: 10),
                    const TextLabel(texto: "Tempo de Experiência (Anos)"),
                    DropdownButton(
                        value: registrationDataModel.timeExperience,
                        isExpanded: true,
                        items: returnsItems(40),
                        onChanged: (value) {
                          setState(() {
                            registrationDataModel.timeExperience =
                                int.parse(value.toString());
                          });
                        }),
                    const SizedBox(height: 10),
                    TextLabel(
                        texto:
                            "Pretensão Salarial. R\$ ${registrationDataModel.chosenSalary?.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 50000,
                        value: registrationDataModel.chosenSalary ?? 0,
                        onChanged: (double value) {
                          setState(() {
                            registrationDataModel.chosenSalary = value;
                          });
                        }),
                    TextButton(
                        onPressed: () async {
                          if (nameController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Nome deve ser preenchido"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          if (registrationDataModel.birthDate == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Data de nascimento deve ser preenchido"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          if (registrationDataModel.level == "") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Nível deve ser selecionado"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          if (registrationDataModel.languages.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Pelo menos uma linguagem deve ser selecionada."),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          if (registrationDataModel.timeExperience == null ||
                              registrationDataModel.timeExperience == 0) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Tempo de experiência deve ser preenchido"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }

                          registrationDataModel.name = nameController.text;

                          registrationDataRepository
                              .save(registrationDataModel);

                          setState(() {
                            saving = true;
                          });

                          print(registrationDataModel.name);
                          print(registrationDataModel.birthDate);
                          print(registrationDataModel.level);
                          print(registrationDataModel.languages);
                          print(registrationDataModel.timeExperience);
                          print(registrationDataModel.chosenSalary);

                          Future.delayed(const Duration(seconds: 1), () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Dados salvos com sucesso"),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.pop(context);
                            setState(() {
                              saving = false;
                            });
                          });
                        },
                        child: const Text("Salvar")),
                  ],
                ),
        ));
  }
}
