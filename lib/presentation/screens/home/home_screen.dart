
import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {

  //constructor
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    
    //usamos el widget ListView
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {

        final menuItem = appMenuItems[index];

        //return Text(menuItem.title);

        //en lugar de mostrar el texto de arriba usamos el widget ListTile mas
        //adecuado para mostrar listas, creado en la clase privada _CustomListTile
        return _CustomListTile(menuItem: menuItem);
      });
      
  
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    //creamos la variable colors para usar el color del theme
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon( menuItem.icon, color: colors.primary), //icono antes del widget
      trailing: Icon( Icons.arrow_forward_ios_rounded, color: colors.primary,), //icono de la derecha
      title: Text( menuItem.title),
      subtitle: Text( menuItem.subTitle),
      //metodo gestual al pulsar el icono para realizar acciones
      onTap: () {
        //TODO navegar a otra pantalla
      },
    );
  }
}