

import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  //constructor
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress indicator'),
      ),
      body:const  _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {

  //constructor
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 30),
          Text('Circula progress indicator'),
          SizedBox(height: 10),
          //colocamos un CircularProgressIndicator
          CircularProgressIndicator( strokeWidth: 2 , backgroundColor: Colors.black45,),

          SizedBox(height: 20),
          Text('Circular y Linear controlado'),
          SizedBox(height: 10),
          //usamos el siguiente widget con la clase creada abajo para que progrese con un porcentaje
          //y no infinitamente como el de arriba
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {

  //contructor
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    //el streamBuilder indica que se creara algo en tiempo de ejecucion
    //ademas esta asociado a un stream(flujo de informacion)
    return StreamBuilder(
      stream: Stream.periodic(const Duration( milliseconds: 300), (value){
        return (value*2) / 100; //emitimos valores que val del 0.0 al 1.0, que equivale de 0 al 100% del progress
      }).takeWhile((value) => value < 1), //decimos que emita hasta que el value sea menor que 1
      //el builder pertenece al StreamBuilder, el primer parametro context es el contexto(buildContext) el arbol de widgets
      //el snaphot es el valor el value creado arriba en el StreamBuilder
      builder: (context, snapshot){ 
      
      final progressValue = snapshot.data ?? 0; //usamos el snapshot de los paramatros del builder para recoger el value, si no viene es cero que es al inicio cuando aun no ha emitido nada
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            //usamos la variable progressValue creada arriba para indicar el progreso
            CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12,),
            //ponemos una separacion horizontal ya que estamos usando un row(fila)
            const SizedBox(width: 20),
            //colocamos el Widget Expanded para que tome todo lo que pueda del padre si colocamos
            //el LinearProgresIndicator sin el Expanded da error ya que no sabe que espacio ocupar
            Expanded(
               //usamos la variable progressValue creada arriba para indicar el progreso
              child: LinearProgressIndicator( value: progressValue,),
            )
          ],
        ),
      );
      } 
    );
  }
}