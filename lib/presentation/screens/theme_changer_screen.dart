
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//la clase hereda de ConsumerWidget para poder usar Riverpood para manejar el estado
class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';


  //constructor
  const ThemeChangerScreen({super.key});

  //al heredar la clase de CpnsumerWidget en el build añadimos el parametro WidgetRef
  //para manejar el estado
  @override
  Widget build(BuildContext context,WidgetRef ref ) {

    final bool isDarkmode = ref.watch( isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
           IconButton(
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //cambiamos el estado del valor booleano referente al modo dark o light
              ref.read(isDarkmodeProvider.notifier)
                .update((state) => !state);
              
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}


//creamos una clase 
class _ThemeChangerView extends ConsumerWidget {

  //constructor
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context,WidgetRef ref ) {

    //usamos los provider creado en theme_provider
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);
   
    //creamos un listado donde contendra todos los colores configurados en el app_thme
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${ color.value}'),
          activeColor: color, //ponemos el color del radioButton del color que muestra
          value: index, 
          groupValue: selectedColor, //valor seleccionado, usamos el estado
          onChanged: ( value ) {
            //notificamos el cambio, cambiamos el estado indicando el index del elemento de la lista seleccionado
            //esta en la variable value y esta variable value se pasa por parametro al onChanged
            ref.read(selectedColorProvider.notifier).state = index;
          }
        );
      });
  }
}