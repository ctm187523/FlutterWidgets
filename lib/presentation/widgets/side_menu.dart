
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

//usamos el StatefulWidget para manejar el estado del contenido del menu lateral
//queremos saber cual es la opcion seleccionada para cambiar y activar opciones
class SideMenu extends StatefulWidget {

  //obtenemso el Key del home_screen para recibir el estado del scafold de esa clase
  final GlobalKey<ScaffoldState> scaffoldKey;

  //constructor 
  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0; //variable para saber que opcion de menu tenemos seleccionado

  @override
  Widget build(BuildContext context) {

    //determinamos si el movil que se esta usando tiene notch, usamos de Mediaquery viewPadding.top
    //para saber cual es padding top que tiene el dispositivo y asi saver si tiene notch o no
    //si es mayor a 35 el padding top sabemos que tiene notch el dispositivo
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex, //usamos la variable usada arriba para saber que opcion de menu tenemos seleccionada
      //cambiamos la opcion del menu seleccionado 
      onDestinationSelected: (value) {

        setState(() {
          navDrawerIndex = value; //cambiamos el valor del indice seleccionado gracias al setState
        });

        //usamos el metodo appMenuItems de la clase MenuItem creada en --> config/menu/menu_items
        //que es un array de instancias de MenuItems donde obtenemos el link para enviarlo a la ruta correspondiente
        //en el value obtenemos el indice del array donde se encuentra ese MenuItem seleccionado
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);

        //obtenemos gracias a la variable creada arriba scaffoldkey el estado del home_screen
        //lo usamos para cerrar el Drawer(menu lateral) despues de redirigir al widget elegido por el usuario
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [
        Padding(
          //fromLTBRB da el padding left,top,right y botton para el margin top
          //usamos el booleano creado arriba hasNotch para determinar si el movil tiene notch o no y variar
          //con el ternario usado el padding top
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 :20, 16, 10),
          child: const Text('Main'),
        ),
        //esparcimos con el spread appMenuItems de -> config/menu/menu_items
        //y los iteramos con map donde usamos el NavigationDrawerDestination
        //para que muestre las diferentes opciones del menu
         ...appMenuItems
          .sublist(0,3) //mostramos los 3 primeros items
          .map((item) =>NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(), //ponemos una linea divisoria
          ),


        const Padding(
        padding: EdgeInsets.fromLTRB(28, 10 , 16, 10),
        child: Text('More options'),
        ),   
      
        ...appMenuItems
          .sublist(3) //mostramos del item 3 hacia adelante
          .map((item) =>NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)
          ),
      ),
          
      ]
    );
  }
}