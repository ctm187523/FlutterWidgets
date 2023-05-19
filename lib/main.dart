import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ponemos MaterialApp.router para configurar el router si usamos go_route, homeScreen es la ruta inicial '/'
    return MaterialApp.router(
      title: 'Flutter Widgets', //titulo de la aplicacion
      routerConfig: appRouter, //usamos la definicion de routes de go_router creada en config/router/app_router
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 5).getTheme(), //usamos la clase creada para el theme
      
      //creamos las rutas para la navegacion entre pantallas
      //LO COMENTAMOS PORQUE USO go_route
      // routes: {
      //   '/buttons':(context) => const ButtonsScreen(),
      //   '/cards':(context) => const CardsScreen()
      // },

    );
  }
}
