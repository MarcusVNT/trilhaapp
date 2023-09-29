import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/page_1.dart';
import 'package:trilhaapp/pages/page_2.dart';
import 'package:trilhaapp/pages/page_3.dart';
import 'package:trilhaapp/pages/registration_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int positionPage = 0;
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
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      positionPage = value;
                    });
                  },
                  children: const [
                    Page1(),
                    Page2(),
                    Page3(),
                  ]),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: positionPage,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.autofps_select_rounded),
                      label: "Automação"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.analytics), label: "Nível dos Tanques"),
                ])
          ],
        ),
      ),
    );
  }
}
