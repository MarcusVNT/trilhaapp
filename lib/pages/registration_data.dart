import 'package:flutter/material.dart';

class RegistrationData extends StatelessWidget {
  final String texto;
  const RegistrationData({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
      ),
      body: const Center(
        child: Text("Dados do usuário"),
      ),
    );
  }
}
