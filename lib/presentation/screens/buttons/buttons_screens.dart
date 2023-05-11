
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  //ponemos los name para el routing de go_route es opcional
  //lo ponemos estatico para poder acceder de las configuraciones de las rutas en  el archivo go_router.dart creado
  static const String name = 'buttons_screen';

  //constructor
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          context.pop(); //usamos de go_router el metodo pop para ir a la pantalla anterior
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  
  //constructor
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme; //variable para obtener el color del Theme

    return SizedBox(
      width: double.infinity, //esto hace que llegue hasta donde pueda el ancho del padre
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //wrap es similar a las columnas row pero cuando no hay mas espacio en columnas
        //crea una nueva linea
        child: Wrap(
          spacing: 10, //espacio entre widgets
          alignment: WrapAlignment.center, //alineamos los botones en el centro
          children: [
            ElevatedButton(onPressed: (){}, child :const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child : Text('Elevated Disabled')), //si en on Pressed en null el boton esta desabilitado
            ElevatedButton.icon( //boton elevvado con icono
              onPressed: (){},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')), //creamos un boton de tipo filled
            FilledButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.mobile_friendly), //creamos un boton de tipo filled con icono
              label: const Text('Filled Icon'),
            ),
            OutlinedButton(onPressed: (){}, child: const Text('Outline')), //boton de tipo outline
            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.outbond_sharp),
              label: const Text('Outline Icon')
            ),//boton de tipo outline con Icono
            TextButton(onPressed: (){}, child: const Text('Text')), //boton tipo Text
            TextButton.icon( //boton tipo Text con Icon
              onPressed: (){}, 
              icon: const Icon(Icons.bakery_dining),
              label: const Text("Text Icon")
              ),
              
              //Creamos botones personalizados usando la clase creada abajo
              const CustomButton(),

              IconButton(onPressed: () {}, icon: const Icon(Icons.zoom_in_map_rounded)),
              IconButton(onPressed: () {}, 
                icon: const Icon(Icons.add_shopping_cart_outlined),
                //ponemos un estilo 
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    //usamos ClipRect para redondear los bordes
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
       //usamos material para personalizar el boton con atributos de Material
      child: Material(
        color: colors.primary,
        //usamos el eidget Inkwell que es parecido a un gesture detector pero reacciona al splash sccreen
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
            child: Text('Boton personalizado', style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}