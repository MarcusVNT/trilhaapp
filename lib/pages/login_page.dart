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
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 3,
                      child: Image.network(
                        "https://yt3.ggpht.com/ytc/AMLnZu-zyneRCxau44njO1mUk0e8h_0GkHoA5v4j3-h6CQ=s900-c-k-c0x00ffffff-no-rj",
                        height: 200,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Já possui uma conta?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "poppins",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Faça login para controlar sua casa sobre rodas!",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    color: const Color.fromARGB(255, 184, 189, 228),
                    height: 36,
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 3),
                        border: InputBorder.none,
                        hintText: 'Nickname',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 115, 123, 173),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  color: const Color.fromARGB(255, 184, 189, 228),
                  height: 36,
                  child: const TextField(
                      decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 3),
                    border: InputBorder.none,
                    hintText: "Senha",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 115, 123, 173),
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 115, 123, 173),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 73, 98, 255)),
                          ),
                          child: const Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ))),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  child: const Text(
                    "Esqueci Minha Senha",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    child: const Text("Criar Conta",
                        style: TextStyle(
                            color: Color.fromARGB(255, 73, 98, 255),
                            fontWeight: FontWeight.w600))),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
