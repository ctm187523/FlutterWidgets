
import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {

  //ponemos los name para el routing de go_route es opcional
  //lo ponemos estatico para poder acceder de las configuraciones de las rutas en  el archivo go_router.dart creado
  static const String name = 'buttons_screen';

  //constructor
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const Placeholder(),
    );
  }
}