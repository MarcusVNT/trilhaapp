import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: Text(
            "Eu Sou Um Imã De Saúde!",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "poppins",
                fontSize: 20),
          ),
        ));
  }
}
