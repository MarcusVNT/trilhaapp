import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/page_1.dart';
import 'package:trilhaapp/pages/page_2.dart';
import 'package:trilhaapp/pages/page_3.dart';
import 'package:trilhaapp/pages/registration_data.dart';
import 'package:trilhaapp/shared/widgets/custon_drawer.dart';

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
        drawer: const CustonDrawer(),
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
