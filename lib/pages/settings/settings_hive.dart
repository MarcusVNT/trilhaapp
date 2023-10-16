import 'package:flutter/material.dart';
import 'package:trilhaapp/models/settings_model.dart';
import 'package:trilhaapp/repositories/settings_repository.dart';

class SettingsHivePage extends StatefulWidget {
  const SettingsHivePage({super.key});

  @override
  State<SettingsHivePage> createState() => _SettingsHivePageState();
}

class _SettingsHivePageState extends State<SettingsHivePage> {
  late SettingsRepository settingsRepository;
  var settingsModel = SettingsModel.vazio();

  var nicknameController = TextEditingController();
  var emailController = TextEditingController();

  final KEY_NICKNAME = "KEY_NICKNAME";
  final KEY_EMAIL = "KEY_EMAIL";
  final KEY_RECEIVE_NOTIFICATION = "KEY_RECEIVE_NOTIFICATION";
  final KEY_DARK_MODE = "KEY_DARK_MODE";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    settingsRepository = await SettingsRepository.load();
    settingsModel = settingsRepository.obterDados();
    nicknameController.text = settingsModel.nickname;
    emailController.text = settingsModel.email;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 236, 246),
      appBar: AppBar(title: const Text("Configurações"), centerTitle: true),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              TextField(
                  controller: nicknameController,
                  // onChanged: (),
                  decoration: const InputDecoration(
                    labelText: "Nickname",
                    icon: Icon(Icons.person),
                    hintText: "Digite seu Nickname",
                  )),
              TextField(
                controller: emailController,
                // onChanged: (),
                decoration: const InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.email),
                  hintText: "Digite seu Email",
                ),
              ),
              SwitchListTile(
                  title: const Text("Receber Notificações"),
                  value: settingsModel.receiveNotification,
                  onChanged: (bool value) {
                    setState(() {
                      settingsModel.receiveNotification =
                          !settingsModel.receiveNotification;
                    });
                  }),
              SwitchListTile(
                title: const Text("Modo Escuro"),
                value: settingsModel.darkMode,
                onChanged: (bool value) {
                  setState(() {
                    settingsModel.darkMode = !settingsModel.darkMode;
                  });
                },
              ),
              TextButton(
                  onPressed: () async {
                    settingsModel.nickname = nicknameController.text;
                    settingsModel.email = emailController.text;
                    settingsRepository.save(settingsModel);
                    Future.delayed(const Duration(milliseconds: 2), () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Configurações salvas!"),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.pop(context);
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      textStyle: const TextStyle(fontSize: 16)),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )),
    ));
  }
}
