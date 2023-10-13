import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreferences storage;

  var nicknameController = TextEditingController();
  var emailController = TextEditingController();
  String? nickname;
  String? email;
  bool receiveNotification = false;
  bool darkMode = false;

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

  void loadData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nicknameController.text = storage.getString(KEY_NICKNAME) ?? "";
      emailController.text = storage.getString(KEY_EMAIL) ?? "";
      receiveNotification = storage.getBool(KEY_RECEIVE_NOTIFICATION) ?? false;
      darkMode = storage.getBool(KEY_DARK_MODE) ?? false;
    });
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
                  value: receiveNotification,
                  onChanged: (bool value) {
                    setState(() {
                      receiveNotification = !receiveNotification;
                    });
                  }),
              SwitchListTile(
                title: const Text("Modo Escuro"),
                value: darkMode,
                onChanged: (bool value) {
                  setState(() {
                    darkMode = !darkMode;
                  });
                },
              ),
              TextButton(
                  onPressed: () async {
                    await storage.setString(
                        KEY_NICKNAME, nicknameController.text);
                    await storage.setString(KEY_EMAIL, emailController.text);
                    await storage.setBool(
                        KEY_RECEIVE_NOTIFICATION, receiveNotification);
                    await storage.setBool(KEY_DARK_MODE, darkMode);
                    Navigator.pop(context);
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
