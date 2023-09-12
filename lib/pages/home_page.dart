import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/generate_random_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number Generator"),
      ),
      body: Center(
          child: Text(generatedNumber.toString(),
              style: GoogleFonts.acme(fontSize: 50))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            generatedNumber = GenerateRandomNumber.generateRandomNumber(100);
          });
        },
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
