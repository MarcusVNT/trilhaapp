import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 204, 247),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                  width: 150,
                  height: 150,
                  color: const Color.fromARGB(255, 192, 177, 177),
                  child:
                      const Icon(Icons.person, size: 100, color: Colors.white)),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 115, 123, 173),
                height: 30,
                child: const Text("Informe seu nickname:"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 184, 189, 228),
                height: 30,
                child: const Text("Nickname:"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 115, 123, 173),
                height: 30,
                child: const Text("Informe seu passwaord:"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 184, 189, 228),
                height: 30,
                child: const Text("Password:"),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 115, 123, 173),
                height: 30,
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                child: const Text("Sign Up"),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
