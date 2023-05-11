import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/screens.dart';


class HomeScreeen extends StatelessWidget {

  //ponemos los name para el routing de go_route es opcional
  //lo ponemos estatico para poder acceder de las configuraciones de las rutas en  el archivo go_router.dart creado
  static const String name = 'home_screen';

  //constructor
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

  //atributos
   final MenuItem menuItem;

  //constructor
  const _CustomListTile({
    required this.menuItem,
  });


  @override
  Widget build(BuildContext context) {
    //creamos la variable colors para usar el color del theme
    final colors = Theme.of(context).colorScheme;

    //usamios el widget ListTile para manejar listas
    return ListTile(
      leading:
        Icon(menuItem.icon, color: colors.primary), //icono antes del widget
          //icono de la derecha
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: colors.primary,
       ), 
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      //metodo gestual al pulsar el icono para realizar acciones
      onTap: () {

        //COMENTAMOS EL CODIGO DE ABAJO PORQUE USAREMOS RUTAS EN SU LUGAR
        //codigo copiado de --> https://docs.flutter.dev/ui/navigation
        //para usar la navagacion entre pantallas
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //llamamos a ButtonsScreens creado en presentation/screens/buttons/buttons_screens
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

        //usamos Navigator para navegar entre pantallas
        //LO COMENTAMOS PORQUE FINALMENTE USO go_router
        //Navigator.pushNamed(context, menuItem.link);

        //uso go_router creado en config/router/app_router, usamos menuItem creado en config/menu/menu_items
        //LO COMENTO PORQUE AUNQUE SIGO USANDO go_router UTILIZO LOS NAMES 
        //context.push(menuItem.link);

        //uso go_router usando push la de arriba comentada tambien seria valida
        //de esta manera es mas facil actualizar la ruta, usamos de menuitem el link de la ruta
        context.push(menuItem.link); 
      },
    );
  }
}

