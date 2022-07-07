
import 'package:app_for_iot/telas/tela_device.dart';
import 'package:flutter/material.dart';
import 'package:app_for_iot/components/add_device.dart';

Adder add = Adder(); 

class NewDevice extends StatefulWidget {
  const NewDevice({Key? key}) : super(key: key);

  @override
  State<NewDevice> createState() => _NewDeviceState();
}

class _NewDeviceState extends State<NewDevice> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var newTaskCtrlNameDevice = TextEditingController();
  String nameDevice = "";
  String typeDevice = "";
  String mainImage = "images/sem-camera.ico";
  String mainTxt = "";

  void _changeMainImage() {
    setState(() {
      if(typeDevice == "LUZ"){
        mainImage = "images/lampada-desconectada.ico";
        mainTxt = "LED";
      }
      else if (typeDevice == "MOTOR"){
        mainImage = "images/motor_init.ico";
        mainTxt = "MOTOR";
      }
      else if(typeDevice == "RELÉ"){
        mainImage = "images/comuta-_1_.ico";
        mainTxt = "RELÉ";
        };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Dispositivo", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent]),
          ),
        ),
      ),
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image(width: 200, height: 200, image: AssetImage(mainImage),),
                ),
                Padding(padding: EdgeInsets.only(top: 0), child:
                Text(mainTxt, style: TextStyle(fontSize: 20, color: Colors.black),),),
                Padding(padding: EdgeInsets.only(top: 15), child: Container(
                  child: Text("Novo Dispositivo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                ),),
                Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                          child: TextFormField(
                            controller: newTaskCtrlNameDevice,
                            style: TextStyle(color: Colors.white,),
                            decoration: InputDecoration(

                              icon: Icon(Icons.settings, color: Colors.white,),
                              hintText: "Nome do dispositivo",
                              hintStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Digite um nome para o dispositivo";
                              }
                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 95, top: 5),
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            hint: Row(
                              children: [
                                Icon(Icons.touch_app, color: Colors.white,),
                                SizedBox(width: 15),
                                Text("Tipo do dispositivo", style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),),
                              ],
                            ),
                            items: <String>['LUZ', 'MOTOR', 'RELÉ'].map((String typeDevice) {
                              return DropdownMenuItem<String>(
                                value: typeDevice,
                                child: Text(typeDevice),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              typeDevice = newValue!;
                              _changeMainImage();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print("Nome device: " + newTaskCtrlNameDevice.text + "Tipo device: " + typeDevice);
                              if (typeDevice != "" && newTaskCtrlNameDevice.value.text != "") {
                                add.addDeviceWidget(newTaskCtrlNameDevice.value.text, typeDevice, context);
                                print(add.listReturn().length);
                                //Navigator.pop(context, MaterialPageRoute(builder: (context)=> TelaDevice()));
                                Navigator.pushNamed(context, '/tela-inicial/tela-device', arguments: Argumentos("telinha", add.listReturn()));
                              } else {
                                print("Não entrarei");
                              }
                            },
                            child: const Text(
                              "Criar dispositivo",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.deepPurple),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),


              ],
            ),
          ),
        ),
      ),),
    );
  }
}

