import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../../service/generate_random_number.dart';

class GenerateNumberHive extends StatefulWidget {
  const GenerateNumberHive({super.key});

  @override
  State<GenerateNumberHive> createState() => _GenerateNumberHiveState();
}

class _GenerateNumberHiveState extends State<GenerateNumberHive> {
  int? generatedNumber = 0;
  var quantityClicks = 0;
  late Box box_random_number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    if (Hive.isBoxOpen('random_number_bor')) {
      box_random_number = Hive.box('random_number_box');
    } else {
      box_random_number = await Hive.openBox('random_number_box');
    }
    generatedNumber = box_random_number.get('generatedNumber') ?? 0;
    setState(() {});
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
          setState(() {
            quantityClicks = quantityClicks + 1;
            generatedNumber = GenerateRandomNumber.generateRandomNumber(60);
          });
          box_random_number.put('generatedNumber', generatedNumber);
        },
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
