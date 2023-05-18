
//importamos math y de la libreria usamos la clase Random para crear numeros aleatorios
import 'dart:math' show Random;
import 'package:flutter/material.dart';

//lo convertimos al StatefulWidget para tener un widget que mantenga un estado
//el estado son las propiedades que queremos animar
class AnimatedScreen extends StatefulWidget {

  static const name = 'animatedScreen';
  //constructor
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  //creamos las propiedades que queremos animar
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

 //usamos la siguiente funcion para cambiar los valores de arriba de forma aleatoria
  void changeShape() {
    
    final random = Random();
    
    width = random.nextInt(300) + 120; //decimos que el valor maximo es 300 y empieza por 50 el valor minimo
    height = random.nextInt(300) + 120;
    color = Color.fromRGBO(
      random.nextInt(255) +1, //red
      random.nextInt(255) +1, //green, 
      random.nextInt(255) +1, //blue, 
      1//la opacidad la dejamos en 1
      );
    borderRadius = random.nextInt(100) + 20;

    setState( () {}); //usamos el metodo  del statefulWidget setState para cambiar el estado

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),

      //usamos el AnimatedContaainer para crear una animacion, lo centramos con Center
      //al pulsar creamos la animacion de cambiar el color,cambiar el borde redondeado
      //y cambiar el tamaño
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut, //con Curves ponemos la propiedad de la animacion como queremos que se anime, suave al inicio,rapido al final,etc, en este caso hacemos un rebote
          width: width <= 0 ? 0 : width, //usamos las varaibles creadas arriba, ponemos una condicion ternaria al width, para evitar valores negaticos
          height: height <= 0 ? 0 : width, //usamos las varaibles creadas arriba
          decoration: BoxDecoration(
            color: color, //usamos las varaibles creadas arriba
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius), //usamos las varaibles creadas arriba
          ),
        ),
      ),

      //boton que al ser pulsado crea la animacion
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape, //llamamos a la funcion creada arriba no lo hacemos de la forma () => changeSape() porque no mandamos argumentos
        child: const Icon( Icons.play_arrow_rounded),
        ),
        
    );
  }
}