import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/repositories/language_repositories.dart';
import 'package:trilhaapp/repositories/level_repositories.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class RegistrationData extends StatefulWidget {
  const RegistrationData({Key? key}) : super(key: key);

  @override
  State<RegistrationData> createState() => _RegistrationDataState();
}

class _RegistrationDataState extends State<RegistrationData> {
  late SharedPreferences storage;

  var nameController = TextEditingController(text: "");
  var birthDateController = TextEditingController(text: "");
  DateTime? birthDate;
  var levelRepository = LevelRepository();
  var levels = [];
  var selectedLevel = "";
  var languagesRepository = LanguagesRepository();
  var languages = [];
  List<String> selectedLanguages = [];
  double chosenSalary = 1320.0;
  int timeExperience = 0;
  bool saving = false;

  final KEY_NAME_DATA = "KEY_NAME_DATA";
  final KEY_BIRTH_DATE_DATA = "KEY_BIRTH_DATE_DATA";
  final KEY_LEVEL_DATA = "KEY_LEVEL_DATA";
  final KEY_LANGUAGES_DATA = "KEY_LANGUAGES_DATA";
  final KEY_TIME_EXPERIENCE_DATA = "KEY_TIME_EXPERIENCE_DATA";
  final KEY_CHOSEN_SALARY_DATA = "KEY_CHOSEN_SALARY_DATA";

  @override
  void initState() {
    // TODO: implement initState
    levels = levelRepository.retornaLevel();
    languages = languagesRepository.retornaLanguages();
    super.initState();
    loadData();
  }

  void loadData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = storage.getString(KEY_NAME_DATA) ?? "";
      birthDateController.text = storage.getString(KEY_BIRTH_DATE_DATA) ?? "";
      selectedLevel = storage.getString(KEY_LEVEL_DATA) ?? "";
      selectedLanguages = storage.getStringList(KEY_LANGUAGES_DATA) ?? [];
      timeExperience = storage.getInt(KEY_TIME_EXPERIENCE_DATA) ?? 0;
      chosenSalary = storage.getDouble(KEY_CHOSEN_SALARY_DATA) ?? 1320.0;
    });
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
                          birthDate = data;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    const TextLabel(texto: "Nível de Experiência"),
                    Column(
                        children: levels
                            .map((level) => RadioListTile(
                                title: Text(level.toString()),
                                selected: selectedLevel == level,
                                value: level,
                                groupValue: selectedLevel,
                                onChanged: (value) {
                                  setState(() {
                                    selectedLevel = value.toString();
                                  });
                                  selectedLevel = value.toString();
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
                                value: selectedLanguages.contains(languages),
                                onChanged: (bool? value) {
                                  if (value!) {
                                    setState(() {
                                      selectedLanguages.add(languages);
                                    });
                                  } else {
                                    setState(() {
                                      selectedLanguages.remove(languages);
                                    });
                                  }
                                },
                              ),
                            )
                            .toList()),
                    const SizedBox(height: 10),
                    const TextLabel(texto: "Tempo de Experiência (Anos)"),
                    DropdownButton(
                        value: timeExperience,
                        isExpanded: true,
                        items: returnsItems(40),
                        onChanged: (value) {
                          setState(() {
                            timeExperience = int.parse(value.toString());
                          });
                        }),
                    const SizedBox(height: 10),
                    TextLabel(
                        texto:
                            "Pretensão Salarial. R\$ ${chosenSalary.round().toString()}"),
                    Slider(
                        min: 1320,
                        max: 50000,
                        value: chosenSalary,
                        onChanged: (double value) {
                          setState(() {
                            chosenSalary = value;
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
                          if (birthDate == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Data de nascimento deve ser preenchido"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          if (selectedLevel == "") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Nível deve ser selecionado"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          if (selectedLanguages.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Pelo menos uma linguagem deve ser selecionada."),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          if (timeExperience == 0) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Tempo de experiência deve ser preenchido"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }

                          await storage.setString(
                              KEY_NAME_DATA, nameController.text);
                          await storage.setString(
                              KEY_BIRTH_DATE_DATA, birthDate.toString());
                          storage.setString(KEY_LEVEL_DATA, selectedLevel);
                          await storage.setStringList(
                              KEY_LANGUAGES_DATA, selectedLanguages);
                          await storage.setInt(
                              KEY_TIME_EXPERIENCE_DATA, timeExperience);
                          await storage.setDouble(
                              KEY_CHOSEN_SALARY_DATA, chosenSalary);

                          setState(() {
                            saving = true;
                          });

                          print(nameController.text);
                          print(birthDate.toString());
                          print(selectedLevel);
                          print(selectedLanguages);
                          print(timeExperience);
                          print(chosenSalary);

                          Future.delayed(const Duration(seconds: 3), () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Dados salvos com sucesso"),
                              backgroundColor: Colors.green,
                            ));
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
