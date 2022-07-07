import 'package:flutter/material.dart';
import 'package:app_for_iot/telas/tela_login.dart';
import 'package:app_for_iot/telas/tela_inicial.dart';
import 'package:app_for_iot/telas/tela_device.dart';
import 'package:app_for_iot/telas/new_device.dart';
import 'package:app_for_iot/telas/status_device.dart';

void main() {
  runApp(const App4Iot());
}

class App4Iot extends StatelessWidget {
  const App4Iot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepPurple, titleTextStyle: TextStyle( fontSize: 25)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xFFFD5722)),
        scaffoldBackgroundColor: Color(0xFF616161),
        textTheme:const TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      initialRoute: '/',
        routes: {
          '/': (context) => TelaLogin(),
          '/tela_inicial': (context) => TelaInicial(),
          //'/tela-inicial/tela-device': (context) => TelaDevice(),
          TelaDevice.routName: (context) => TelaDevice(),
          '/tela-inicial/tela-device/new-device': (context) => NewDevice(),
          //'/tela-inicial/tela-device/status_device': (context) => StatusDevice(),
          StatusDevice.routName: (context) => StatusDevice(),
        },
    );
  }
}
