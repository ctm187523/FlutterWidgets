import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//instalamos riverpod , lo he instaldo en pubspec con--> flutter pub add flutter_riverpod dev:custom_lint dev:riverpod_lint riverpod_annotation dev:build_runner dev:riverpod_generator 
//para manejar el estado envolvemos el main con ProviderScope para mantener una 
//referencia a todos los providers
void main() {

  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

//usamos ConsumerWidget para recibir el estado de Riverppod
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

//añadimos en los parametros del buidl WidgetRef al heredar de ConsumerWidget para obtener los estados que necesitemos
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //recibimos el estado de Riverppod
    final int selectedColor = ref.watch(selectedColorProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    //ponemos MaterialApp.router para configurar el router si usamos go_route, homeScreen es la ruta inicial '/'
    return MaterialApp.router(
      title: 'Flutter Widgets', //titulo de la aplicacion
      routerConfig: appRouter, //usamos la definicion de routes de go_router creada en config/router/app_router
      debugShowCheckedModeBanner: false,
      //usamos el estado obtenido arriba para cambiar el color seleccionado y el tema dark o light
      theme: AppTheme(selectedColor: selectedColor, isDarkmode: isDarkmode).getTheme(), //usamos la clase creada para el theme seleccionamos el color y el tema oscuro o claro
      
      //creamos las rutas para la navegacion entre pantallas5
      //LO COMENTAMOS PORQUE USO go_route
      // routes: {
      //   '/buttons':(context) => const ButtonsScreen(),
      //   '/cards':(context) => const CardsScreen()
      // },

    );
  }
}
