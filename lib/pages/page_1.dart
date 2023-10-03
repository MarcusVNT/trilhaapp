import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Card(
              elevation: 10,
              shadowColor: Color.fromARGB(255, 52, 30, 153),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.money_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Eu Sou Um Imã De Prosperidade!",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "poppins",
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        "“Eu sou um imã de prosperidade. Atraio abundância e sucesso em todas as áreas da minha vida. Com cada respiração que tomo, atraio mais riqueza e felicidade. Minha mente está cheia de pensamentos positivos e minha vida está cheia de oportunidades. Eu sou grato por tudo o que tenho e estou animado pelo que ainda está por vir. Eu sou um imã de prosperidade.”",
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic)),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
