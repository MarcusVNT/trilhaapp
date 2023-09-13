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
  var quantityClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number Generator"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("O botão foi clicado ${quantityClicks.toString()} vezes:",
                style: GoogleFonts.acme(fontSize: 16)),
            const Text(""),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                color: const Color.fromARGB(255, 115, 123, 173),
                child: Text("O número gerado foi:",
                    style: GoogleFonts.acme(fontSize: 24))),
            const Text(""),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              color: const Color.fromARGB(255, 236, 236, 236),
              child: Text(generatedNumber.toString(),
                  style: GoogleFonts.acme(fontSize: 48)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quantityClicks = quantityClicks + 1;
            generatedNumber = GenerateRandomNumber.generateRandomNumber(100);
          });
        },
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
