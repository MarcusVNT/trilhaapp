import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/generate_random_number.dart';

class GenerateNumber extends StatefulWidget {
  const GenerateNumber({super.key});

  @override
  State<GenerateNumber> createState() => _GenerateNumberState();
}

class _GenerateNumberState extends State<GenerateNumber> {
  int? generatedNumber = 0;
  var quantityClicks = 0;
  final CHAVE_NUMERO_SORTE = "numero_sorte";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    final storage = await SharedPreferences.getInstance();
    // setState(() {
    generatedNumber = storage.getInt(CHAVE_NUMERO_SORTE);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 215, 0, 1),
      appBar: AppBar(
        title: const Text("Gerador de Números da Sorte"),
        centerTitle: true,
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
                color: const Color.fromRGBO(255, 215, 0, 1),
                child: Text("O número gerado foi:",
                    style: GoogleFonts.acme(fontSize: 24))),
            const Text(""),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              color: const Color.fromARGB(255, 255, 220, 23),
              child: Text(generatedNumber.toString(),
                  style: GoogleFonts.acme(fontSize: 48)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final storage = await SharedPreferences.getInstance();
          setState(() {
            quantityClicks = quantityClicks + 1;
            generatedNumber = GenerateRandomNumber.generateRandomNumber(60);
          });
          storage.setInt(CHAVE_NUMERO_SORTE, generatedNumber!);
        },
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
