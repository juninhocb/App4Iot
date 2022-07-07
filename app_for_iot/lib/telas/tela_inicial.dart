import 'package:app_for_iot/telas/tela_device.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Painel de Controle",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.deepPurpleAccent, Colors.pinkAccent], begin: Alignment.topRight, end: Alignment.bottomLeft ),
          ),

        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent], begin: Alignment.topRight, end: Alignment.bottomLeft),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                height: 250,
                image: AssetImage("images/iot.ico"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                      ),
                      onPressed: (() {
                        Navigator.pushNamed(context, '/tela-inicial/tela-device', arguments: Argumentos("telinha", []));

                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage("images/smart-bulb.ico"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                      ),
                      onPressed: (() {}),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage("images/local.ico"),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                      ),
                      onPressed: (() {}),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage("images/cenario.ico"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                      ),
                      onPressed: (() {}),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage("images/config.ico"),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
