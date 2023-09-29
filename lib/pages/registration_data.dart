import 'package:flutter/material.dart';
import 'package:trilhaapp/shared_widgets/text_label.dart';

class RegistrationData extends StatefulWidget {
  const RegistrationData({Key? key}) : super(key: key);

  @override
  State<RegistrationData> createState() => _RegistrationDataState();
}

class _RegistrationDataState extends State<RegistrationData> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextLabel(texto: "Nome"),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  hintText: "Digite seu nome",
                ),
              ),
              const SizedBox(height: 10),
              const TextLabel(texto: "Data de Nascimento"),
              TextField(
                controller: dataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2024, 1, 1),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2057),
                  );
                  if (data != null) {
                    dataNascimentoController.text =
                        "${data.day}/${data.month}/${data.year}";
                    dataNascimento = data;
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    print(nomeController.text);
                    print(dataNascimento.toString());
                  },
                  child: const Text("Salvar")),
            ],
          ),
        ));
  }
}
