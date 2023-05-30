
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//extendemos nuestra clase con ConsumerWidget de Riverpod para manejar el estado
class CounterScreen extends ConsumerWidget {

  static const name = 'counterScreen';

  const CounterScreen({super.key});


  // en el build al heredar de ConsumerWidget de Riverpod agregamos como parametro
  //WidgetRef ref, donde en ref obtenemos el estado que queremos consumir, la referencia
  //al provider que vamos a uasr
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //usamos el parametro de tipo WidegetRef de Riverpod y le decimos con ref.watch(counterProvider)
    //el estado que queremos observar que en este caso es el counterProvider creado en presentation/providers/counter_provider
    final clickCounter = ref.watch( counterProvider);
    final bool isDarkmode = ref.watch( isDarkmodeProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          //dependiendo del valor del booleano isDarkmode que es un observador del estado Riverpood
          //mostramos un icono o otro si es el tema dark o ligth
          IconButton(
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //modificamos el valor del estado del booleano y le ponemos el opuesto con el signo !
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
              
            }, 
          )
        ],
      ),
      body: Center(
        //usamos la referencia al estado clickCounter creado arriba
       child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge,)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          //usamos el metodo read de la referencia del estate manejado por Riverpod para leer
          //el estado y cambiarlo indicamos con notifier que se comunique el cambio y aumentamos en 
          //una unidad el state que en este caso es un entero, 
          ref.read( counterProvider.notifier).state++;

          //tambien se podira hacer lo de arriba de esta manera:(lo comentamos)
          //ref.read( counterProvider.notifier).update((state) => state +1);

         },
        child: const Icon(Icons.add),
        )
    );
  }
}