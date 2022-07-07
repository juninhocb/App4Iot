
import 'package:flutter/material.dart';
import 'package:app_for_iot/telas/status_device.dart';
import 'package:app_for_iot/telas/tela_device.dart';



class Adder{

  List<Widget> _deviceList = [];
  List<String> _deviceStringList = [];


  showAlertDialog(BuildContext context,String name) {
    Widget cancelaButton = ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),),
      child: Text("Cancelar", style: TextStyle(color: Colors.white),),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continuaButton = ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
      child: Text("Remover", style: TextStyle(color: Colors.white),),
      onPressed:  () {
        _delDeviceWidget(name);
        Navigator.pushNamed(context, '/tela-inicial/tela-device', arguments: Argumentos("telinhaa", listReturn()) );
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.deepPurpleAccent,
      title: const Text("Alerta!", style: TextStyle(color: Colors.white),),
      content: Text("Deseja remover o dispositivo $name?", style: TextStyle(color: Colors.white),),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void addDeviceWidget(nameDevice, typeDevice, context) {
      print(_deviceList.length);
      if (nameDevice != "" && typeDevice != "" ){
        String imgShow = "images/sem-camera.ico";
        String imgShow2 = "images/sem-camera.ico";
        if (typeDevice == "LUZ"){
          imgShow = "images/lampada-desconectada.ico";
          imgShow2 = "images/lampada-desconectada.ico";
          _deviceStringList.add(nameDevice);
          _deviceList.add(_deviceLed(nameDevice, imgShow, context, imgShow2));
        }else if(typeDevice == "MOTOR"){
          imgShow = "images/motor_init.ico";
          imgShow2 = "images/motor_init.ico";
          _deviceStringList.add(nameDevice);
          _deviceList.add(_deviceMotor(nameDevice, imgShow, context, imgShow2));
        }else if(typeDevice == "RELÉ"){
          imgShow = "images/comuta-_1_.ico";
          imgShow2 = "images/comuta-_1_.ico";
          _deviceStringList.add(nameDevice);
          _deviceList.add(_deviceRele(nameDevice, imgShow, context, imgShow2));

        };
      };
  }

  void _delDeviceWidget(nameDel) {
         for (int i =0 ; i < _deviceList.length; i ++){
           print(_deviceStringList[i]);
           if(nameDel == _deviceStringList[i]){
             print("Irei remover o: " + _deviceStringList[i]);
            _deviceList.removeAt(i);
            _deviceStringList.removeAt(i);
        };
      }
  }

  Widget _deviceLed(nameDevice, imgShow, context, imgShow2) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent])
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: ((){
              showAlertDialog(context, nameDevice);
            }), icon: Icon(Icons.close),),
            Text("Dispositivo: " + nameDevice, style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, '/tela-inicial/tela-device/status_device', arguments: ArgumentosStats(nameDevice, "LED", imgShow2));
                  }),
                  iconSize: 100,
                  icon: Image.asset(imgShow),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 8),
                  child: Text("LED", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget _deviceMotor(nameDevice, imgShow, context, imgShow2) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent])
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: ((){
              showAlertDialog(context, nameDevice);
            }), icon: Icon(Icons.close),),
            Text("Dispositivo: " + nameDevice, style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, '/tela-inicial/tela-device/status_device', arguments: ArgumentosStats(nameDevice, "MOTOR", imgShow2));
                  }),
                  iconSize: 100,
                  icon: Image.asset(imgShow),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 8, bottom: 5),
                  child: Text("MOTOR", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget _deviceRele(nameDevice, imgShow, context, imgShow2) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent])
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: ((){
              showAlertDialog(context, nameDevice);
            }), icon: Icon(Icons.close),),
            Text("Dispositivo: " + nameDevice, style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, '/tela-inicial/tela-device/status_device', arguments: ArgumentosStats(nameDevice, "RELÉ", imgShow2));
                  }),
                  iconSize: 100,
                  icon: Image.asset(imgShow),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 8),
                  child: Text("RELE", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }


  List<Widget> listReturn() {
    return _deviceList;
  }


}