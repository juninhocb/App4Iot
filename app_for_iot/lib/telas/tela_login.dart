import 'package:flutter/material.dart';
import 'package:app_for_iot/sign_in/sign_in.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var newTaskCtrlUsr = TextEditingController();
  var newTaskCtrlPw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('images/iot.ico'),
                          ),
                          SizedBox(height: 10,),
                          Text("APP  4  IOT", style: TextStyle(
                              fontSize: 35,
                              fontFamily: "TheNautigal",
                              fontWeight: FontWeight.bold),


                          ),
                        ],
                      )),
                  SizedBox(height: 50,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                        top: 30,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [

                            TextFormField(
                              controller: newTaskCtrlUsr,
                              style: TextStyle(color: Colors.white,),
                              decoration: InputDecoration(

                                icon: Icon(Icons.man, color: Colors.white,),
                                hintText: "Usuário",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Digite o usuário";
                                }
                                return null;
                              },

                            ),
                            TextFormField(
                              controller: newTaskCtrlPw,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock, color: Colors.white,),
                                hintText: "Senha",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontStyle: FontStyle.italic),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Digite a senha";
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (newTaskCtrlUsr.value.text == "Jr" && newTaskCtrlPw.text == "123") {
                                    Navigator.pushNamed(context, "/tela_inicial");
                                  } else {
                                    print("Não entrarei");
                                  }
                                },
                                child: const Text(
                                  'Entrar',
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
                    ),
                  ),
                  _signInButton(),
                  SizedBox(height: 70,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _signInButton() {
    return OutlinedButton(
      style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
        elevation: MaterialStateProperty.all(0),
        ),
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.pushNamed(context, "/tela_inicial");
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
