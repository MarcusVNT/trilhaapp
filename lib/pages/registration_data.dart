import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/language_repositories.dart';
import 'package:trilhaapp/repositories/level_repositories.dart';
import 'package:trilhaapp/shared_widgets/text_label.dart';

class RegistrationData extends StatefulWidget {
  const RegistrationData({Key? key}) : super(key: key);

  @override
  State<RegistrationData> createState() => _RegistrationDataState();
}

class _RegistrationDataState extends State<RegistrationData> {
  var nameController = TextEditingController(text: "");
  var birthDateController = TextEditingController(text: "");
  DateTime? birthDate;
  var levelRepository = LevelRepository();
  var levels = [];
  var selectedLevel = "";
  var languagesRepository = LanguagesRepository();
  var languages = [];
  var selectedLanguages = [];
  double chosenSalary = 1320.0;

  @override
  void initState() {
    // TODO: implement initState
    levels = levelRepository.retornaLevel();
    languages = languagesRepository.retornaLanguages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: ListView(
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
                  onPressed: () {
                    print(nameController.text);
                    print(birthDate.toString());
                    print(selectedLevel);
                    print(selectedLanguages);
                    print(chosenSalary);
                  },
                  child: const Text("Salvar")),
            ],
          ),
        ));
  }
}
