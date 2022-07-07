import 'package:flutter/material.dart';


class Argumentos {

  List <Widget> listShow = [];

  String name = "";

  Argumentos (this.name, this.listShow);
}

class TelaDevice extends StatefulWidget {
  static const routName = '/tela-inicial/tela-device';

  TelaDevice({Key? key}) :  super(key: key);

  @override
  State<TelaDevice> createState() => _TelaDeviceState();
}

class _TelaDeviceState extends State<TelaDevice> {
  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Gerenciador de dispositivos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          constraints: BoxConstraints.expand(),
          child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: ListView.builder(
              itemCount: argumentos.listShow.length, itemBuilder: (context,index){
              return argumentos.listShow[index];
            }),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 15),
        child: FloatingActionButton(
          tooltip: 'Add',
          onPressed: (() {
            Navigator.pushNamed(context, '/tela-inicial/tela-device/new-device');
          }),
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
