import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  //constructor
  const SnackbarScreen({super.key});

  //metodo para mostrar el snackbar. recibe el contexto en la llamada del floatingButton de abajo
  void showCustomSnackbar(BuildContext context) {

    //limpiamos los snackbaks anteriores
    ScaffoldMessenger.of(context).clearSnackBars();

    //creamos el snackback y usamos sus atributos content,action,duration
    final snakback = SnackBar(
      content: const Text('Has pulsado'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
      duration: const Duration(seconds: 2),
      );
    
    //usamos el ScaffolfMessenger para que aparezca el snakbar en el scaffol del metodo build de abajo
    ScaffoldMessenger.of(context).showSnackBar(snakback);
  }

  //creamos un metodo para la creacion del diálogo personalizado
  void openDialog( BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, //con esta opcion obligamos a que el usuario acepte una de las opciones si pulas fuera de dialog no se cierra
      //el builder ejecuta algo en tiempo de ejecucion, ejecutamos un alert
      builder: (context) =>  AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Cillum enim esse ad do consectetur fugiat ad laborum. Duis enim ipsum labore nulla exercitation mollit elit est est cupidatat consequat exercitation culpa quis. Aute proident id sunt nostrud fugiat ipsum dolore ut sit anim. Exercitation veniam ipsum cupidatat ex culpa excepteur dolor laboris velit ea reprehenderit nisi.'),
        //coloamos las acciones a realizar al pulsar sobre los botones de cancelar y aceptar
        actions: [
          //con context.pop() cerramos el dialogo gracias al uso de go_router
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),

      body: Center(
        child: Column(
          //alineamos los hijos al centro
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //colocamos un boton FilledButton
            FilledButton.tonal(
              //al pulsar aparece un recuadro con el contenido, tiene un boton de swhoLicense
              //donde muestras las licencias de a aplicacion
              onPressed: () {
                showAboutDialog(
                  context: context,
                  //ponemos el contenido del Dialog
                  children: [
                    const Text('Non fugiat ipsum ut amet qui dolor proident amet sit magna cillum adipisicing et aliqua. Fugiat consectetur excepteur pariatur irure id tempor aliqua ad ullamco dolor consectetur. Officia non esse deserunt labore voluptate enim dolore fugiat. Exercitation est aliquip exercitation incididunt non reprehenderit velit sunt ad incididunt cillum. Aute reprehenderit mollit deserunt velit nostrud elit elit deserunt.')
                  ]
                  );
              }, child: const Text('Licencias usadas')),
           
            //colocamos otro boton donde realizamos un diálogo personalizado
            FilledButton.tonal(
           //llamamos a la funcion creada arriba
            onPressed: () => openDialog(context),
           child: const Text('Mostrar diálogo'))
          ],
        ),
      ) ,
      //usamos un floatingButton extended
      floatingActionButton: FloatingActionButton.extended(
          //al pulsar mostramos el snackback,tenemos que identificar el scaffold
          //sin importar donde nos encontramos le decimos a Flutter que en el scaffold
          //mas cercano construya el snackbar, usamos el ScaffoldMesenger en el metodo creado arriba showCustomSnackbar
          //llamamos al metodo showCustomSnacknar que es quien realiza la accion
          onPressed: () => showCustomSnackbar(context),
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_rounded)),
    );
  }
}
