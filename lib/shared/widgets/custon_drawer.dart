import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/generate_number/generate_number_hive.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/registration_data.dart';
import 'package:trilhaapp/pages/settings/settings_hive.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: const Text("Câmera"),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text("Galeria"),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
          child: const UserAccountsDrawerHeader(
            accountName: Text("Marcus Vinícius"),
            accountEmail: Text("marcus-vnt@live.com"),
            currentAccountPicture: CircleAvatar(
              child: Text("MV"),
            ),
          ),
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Meus Dados"),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrationData()));
          },
        ),
        const Divider(),
        const SizedBox(height: 10),
        InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.confirmation_num_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Gerador de Números da Sorte"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const GenerateNumberHive()));
            }),
        const Divider(),
        const SizedBox(height: 10),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.privacy_tip),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Privacidade e Segurança"),
                ],
              )),
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Column(
                        children: [
                          Text("Privacidade e Segurança",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Text(
                              "A segurança e privacidade são preocupações essenciais na era digital. Proteger nossos dados pessoais e informações sensíveis é fundamental para evitar ameaças cibernéticas. Através de senhas robustas, autenticação de dois fatores e atualizações regulares de software, podemos fortalecer nossa segurança online. Além disso, educar-se sobre phishing e outras táticas de engenharia social é crucial. Juntos, podemos criar um ambiente online mais seguro e proteger nossa privacidade digital."),
                        ],
                      ));
                });
          },
        ),
        const Divider(),
        const SizedBox(height: 10),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sobre o App"),
                ],
              )),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sobre o App clicado!")));
          },
        ),
        const Divider(),
        const SizedBox(height: 10),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Configurações"),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsHivePage()));
          },
        ),
        const Divider(),
        const SizedBox(height: 10),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            child: const Row(
              children: [
                Icon(Icons.exit_to_app),
                SizedBox(
                  width: 10,
                ),
                Text("Sair"),
              ],
            ),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      title: const Text(
                        "Nome do App",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Text("Deseja realmente sair?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim")),
                      ]);
                });
          },
        ),
        const Divider(),
      ],
    ));
  }
}
