import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Vida me surpreenda!")),
        drawer: Drawer(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    width: double.infinity,
                    child: const Text("Meus Dados")),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Dados do usuário clicado!")));
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    width: double.infinity,
                    child: const Text("Privacidade e Segurança")),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Privacidade e Segurança clicado!")));
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    width: double.infinity,
                    child: const Text("Sobre o App")),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sobre o App clicado!")));
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    width: double.infinity,
                    child: const Text("Configurações")),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Configurações clicado!")));
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    width: double.infinity,
                    child: const Text("Sair")),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sair clicado!")));
                },
              ),
              const Divider(),
            ],
          ),
        )),
      ),
    );
  }
}
