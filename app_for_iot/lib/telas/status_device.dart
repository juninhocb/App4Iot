import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ArgumentosStats {

  String nameDevice;
  String typeDevice;
  String showImg;

  ArgumentosStats (this.nameDevice, this.typeDevice, this.showImg);
}

showAlertDialogState(BuildContext context, String msg)
{
  Widget okButton = ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),),
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alerta = AlertDialog(
    backgroundColor: Colors.deepPurpleAccent,
    title: Text("Falha de Comunicação com os servidores!", style: TextStyle(color: Colors.white),),
    content: Text(msg, style: TextStyle(color: Colors.white),),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

showOkDialogState(BuildContext context,String conn,String state)
{
  Widget okButton = ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),),
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alerta = AlertDialog(
    backgroundColor: Colors.deepPurpleAccent,
    title: Text("Informações do dispositivo", style: TextStyle(color: Colors.white),),
    content: Text("CONEXÃO: " + conn + "." + "\n\nESTADO: " + state + ".", style: TextStyle(color: Colors.white),),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

class ReciveStats {
  final bool state;
  final bool conn;

  const ReciveStats ({required this.state, required this.conn});

  factory ReciveStats.fromJson(Map<String, dynamic> json){
    return ReciveStats(state: json['Estado'], conn: json['ConexÃ£o']);
  }

}



class StatusDevice extends StatefulWidget {
  static const routName = '/tela-inicial/tela-device/status_device';
  const StatusDevice({Key? key}) : super(key: key);

  @override
  State<StatusDevice> createState() => _StatusDeviceState();
}

class _StatusDeviceState extends State<StatusDevice> {
  String stateMsg = "desconectado";
  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as ArgumentosStats;
    return Scaffold(
      appBar: AppBar(title: Text("Status: " + argumentos.nameDevice),
      automaticallyImplyLeading: true,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent])
        ),
      ),),
      body: SafeArea(child:
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(argumentos.nameDevice, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
            Image(width: 250, height: 250, image: AssetImage(argumentos.showImg)),
            Text(stateMsg, style: TextStyle(fontSize: 15, color: Colors.black),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(onPressed: (() async {
                    //var url = Uri.parse("http://192.168.0.4:8080/trigger/${argumentos.nameDevice}" );
                    var url = Uri.parse("http://server4iot.herokuapp.com/trigger/${argumentos.nameDevice}" );
                    var response = await http.post(url);
                    print('Response status: ${response.statusCode}');
                    setState(()  {
                      if (response.statusCode == 200){
                        if(argumentos.typeDevice == "LED"){
                          argumentos.showImg = "images/lampada-ligada.ico";
                          stateMsg = "ligado";
                        } else if (argumentos.typeDevice == "MOTOR"){
                          argumentos.showImg = "images/motor-ligado.ico";
                          stateMsg = "ligado";
                        } else if (argumentos.typeDevice == "RELÉ"){
                          argumentos.showImg = "images/rele.ico";
                          stateMsg = "ligado";
                        }
                      } else {
                        if (argumentos.typeDevice == "LED"){
                          argumentos.showImg = "images/lampada-desconectada.ico";
                          stateMsg = "desconectado";
                        } else if (argumentos.typeDevice == "MOTOR"){
                          argumentos.showImg = "images/motor_init.ico";
                          stateMsg = "desconectado";
                        } else if (argumentos.typeDevice == "RELÉ"){
                          argumentos.showImg = "images/comuta-_1_.ico";
                          stateMsg = "desconectado";
                        }

                      }
                    });
                  }), child: Text("Ligar", style: TextStyle(fontSize: 30, color: Colors.white),),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),),),
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(onPressed: (() async {
                    //var url2 = Uri.parse("http://192.168.0.4:8080/deactivate/${argumentos.nameDevice}" );
                    var url2 = Uri.parse("http://server4iot.herokuapp.com/deactivate/${argumentos.nameDevice}" );
                    var response2 = await http.post(url2);
                    print('Response status: ${response2.statusCode}');
                    setState((){
                      if (response2.statusCode == 200){
                        if(argumentos.typeDevice == "LED"){
                          argumentos.showImg = "images/lampada-desligada.ico";
                          stateMsg = "desligado";
                        } else if (argumentos.typeDevice == "MOTOR"){
                          argumentos.showImg = "images/motor-desligado.ico";
                          stateMsg = "desligado";
                        } else if (argumentos.typeDevice == "RELÉ"){
                          argumentos.showImg = "images/comuta.ico";
                          stateMsg = "desligado";
                        }
                      } else {
                        if (argumentos.typeDevice == "LED"){
                          argumentos.showImg = "images/lampada-desconectada.ico";
                          stateMsg = "desconectado";
                        } else if (argumentos.typeDevice == "MOTOR"){
                          argumentos.showImg = "images/motor_init.ico";
                          stateMsg = "desconectado";
                        } else if (argumentos.typeDevice == "RELÉ"){
                          argumentos.showImg = "images/comuta-_1_.ico";
                          stateMsg = "desconectado";
                        }
                      }
                    });
                  }), child: Text("Desligar", style: TextStyle(fontSize: 30, color: Colors.white),),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: (() async {
                    var respBodyState = false;
                    var respBodyConn = false;
                    //var url3 = Uri.parse("http://192.168.0.4:8080/stats/${argumentos.nameDevice}" );
                    var responseCode = 0;
                    var responseBody;
                    String connResp;
                    String stateResp;
                    var url3 = Uri.parse("http://server4iot.herokuapp.com/stats/${argumentos.nameDevice}" );
                    try {
                      var response  = await http.get(url3);
                      print('Response status: ${response.statusCode}');
                      responseCode = response.statusCode;
                      responseBody = response.body;
                      if(ReciveStats.fromJson(jsonDecode(responseBody)).state == true){
                        stateResp = "ligado";
                      } else { stateResp = "desligado";};

                      if (ReciveStats.fromJson(jsonDecode(responseBody)).conn == true){
                        connResp = "conectado";
                      } else {connResp = "desconectado";}
                      showOkDialogState(context, connResp, stateResp);

                    } catch (e){
                      print("Falha de comunicação com os servidores");
                      if (e.toString() == "type 'Null' is not a subtype of type 'bool'"){
                        showAlertDialogState(context, "Dispositivo ${argumentos.nameDevice} não está cadastrado no sistema.");
                      }else {
                        showAlertDialogState(context, "Houve uma falha de comunicação, tente novamente.");
                      }
                    }

                    print(responseCode);
                    setState ((){
                      if (responseCode == 200){
                        try {
                          respBodyState = ReciveStats.fromJson(jsonDecode(responseBody)).state;
                          respBodyConn = ReciveStats.fromJson(jsonDecode(responseBody)).conn;
                        } catch (e){
                          print(e.runtimeType);
                          showAlertDialogState(context, "Não foi possível identificar os stats dos dispositivos.");
                        }
                        print(respBodyState);
                        print(respBodyConn);
                        if (argumentos.typeDevice == "LED" && respBodyConn && respBodyState){
                          stateMsg = "ligado";
                          argumentos.showImg = "images/lampada-ligada.ico";
                        } else if (argumentos.typeDevice == "LED" && !respBodyConn){
                          stateMsg = "desconectado";
                          argumentos.showImg = "images/lampada-desconectada.ico";
                        } else if (argumentos.typeDevice == "LED" && respBodyConn && !respBodyState){
                          stateMsg = "desligado";
                          argumentos.showImg = "images/lampada-desligada.ico";
                        }
                        if (argumentos.typeDevice == "MOTOR" && respBodyConn && respBodyState){
                          stateMsg = "ligado";
                          argumentos.showImg = "images/motor-ligado.ico";
                        } else if (argumentos.typeDevice == "MOTOR" && !respBodyConn){
                          stateMsg = "desconectado";
                          argumentos.showImg = "images/motor_init.ico";
                        } else if (argumentos.typeDevice == "MOTOR" && respBodyConn && !respBodyState){
                          stateMsg = "desligado";
                          argumentos.showImg = "images/motor-desligado.ico";
                        }
                        if (argumentos.typeDevice == "RELÉ" && respBodyConn && respBodyState){
                          stateMsg = "ligado";
                          argumentos.showImg = "images/rele.ico";
                        } else if (argumentos.typeDevice == "RELÉ" && !respBodyConn){
                          stateMsg = "desconectado";
                          argumentos.showImg = "images/comuta-_1_.ico";
                        } else if (argumentos.typeDevice == "RELÉ" && respBodyConn && !respBodyState){
                          stateMsg = "desligado";
                          argumentos.showImg = "images/comuta.ico";
                        }
                      }
                    });

                }), backgroundColor: Colors.deepPurpleAccent, child: Icon(Icons.refresh),),

              ],
            )
          ],
        ),
      )),
    );
  }
}
