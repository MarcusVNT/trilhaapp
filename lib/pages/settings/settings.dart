import 'package:flutter/material.dart';
import 'package:trilhaapp/service/storage_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  StorageService storage = StorageService();

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

  loadData() async {
    nicknameController.text = await storage.getNickname();
    emailController.text = await storage.getEmail();
    receiveNotification = await storage.getReceiveNotification();
    darkMode = await storage.getDarkMode();
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
                    await storage.setNickname(nicknameController.text);
                    await storage.setEmail(emailController.text);
                    await storage.setReceiveNotification(receiveNotification);
                    await storage.setDarkMode(darkMode);
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
