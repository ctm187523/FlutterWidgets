
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {

  //ponemos los name para el routing de go_route es opcional
  //lo ponemos estatico para poder acceder de las configuraciones de las rutas en  el archivo go_router.dart creado
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const Placeholder(),
    );
  }
}