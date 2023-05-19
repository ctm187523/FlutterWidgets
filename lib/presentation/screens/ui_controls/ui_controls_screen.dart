

import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';
  //constructor
  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

//heredamos de StatefulWidget para manejar los estados
class _UiControlsView extends StatefulWidget {

  //constructor
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

//creamos una enum para las opciones del radio button RadioListTile
enum Transportation { car, plane, boat, submarine}

class _UiControlsViewState extends State<_UiControlsView> {

  //variables de clase
  bool isDevelopper = true; //booleano para usar en SwitchListTile
  //usamos el selectedTranportation para saber que valor hemos seleccionado
  Transportation selectedTransportation = Transportation.car; 
  //booleanos para el checkboxtile
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(), //quitamos el rebote que tiene por defecto
      children: [
        //colocamos un boton SwitchListTile es un switch que esta dentro de una lista
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDevelopper,  //usamos la variable booleana creada arriba isDevelopper
          onChanged: (value) => setState(() { //usamos el setState del StatefulWidget para cambiar el estado
            isDevelopper = !isDevelopper; //cambiamos el estado de la variable booleana isDevelopper 
          }),
        ),

        //usamos el widget Expansion Tile, nos indica en el subtitle el radio button seleccionado
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          //en el children ponemos todos los radiobutton(RadioListTile), nos permite que al tocar
          //la flecha de la derecha aparezcan y desaparezcan los radio buttons contenidos
          children: [
            //usamos los radio button con RadioListTile que es un radio Button en un List
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar en coche'),
              value: Transportation.car, //usamos el enum creado arriba, nos sirve para enlazar el valor seleccionado con el valor actual
              groupValue: selectedTransportation, //usamos la variable de clase creada arriba
              onChanged: (value) => setState(() { //usamos el setState para los cambios de estado
                selectedTransportation = Transportation.car;
              })
            ),

            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat, //usamos el enum creado arriba, nos sirve para enlazar el valor seleccionado con el valor actual
              groupValue: selectedTransportation, //usamos la variable de clase creada arriba
              onChanged: (value) => setState(() { //usamos el setState para los cambios de estado
                selectedTransportation = Transportation.boat;
              })
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar en avion'),
              value: Transportation.plane, //usamos el enum creado arriba, nos sirve para enlazar el valor seleccionado con el valor actual
              groupValue: selectedTransportation, //usamos la variable de clase creada arriba
              onChanged: (value) => setState(() { //usamos el setState para los cambios de estado
                selectedTransportation = Transportation.plane;
              })
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarine, //usamos el enum creado arriba, nos sirve para enlazar el valor seleccionado con el valor actual
              groupValue: selectedTransportation, //usamos la variable de clase creada arriba
              onChanged: (value) => setState(() { //usamos el setState para los cambios de estado
                selectedTransportation = Transportation.submarine;
              })
            ),
             const SizedBox(height: 20),
              //mostramos el RadioListTile seleccionado
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                  child: 
                    Text('Has seleccionado $selectedTransportation', 
                        style: const  TextStyle(
                          color: Colors.blueGrey, 
                          fontWeight: FontWeight.bold),
                        )
                ),
              ),
          ],
          ),
        
        //usamos el widget CheckboxListTile para crear checkbox
        CheckboxListTile(
          title: const Text('¿Incluir desayuno?'),
          value: wantsBreakfast, //usamos los booleanos creados arriba en las variables de clase
          onChanged: (value) => setState(() { //usamos el setState para el estado
            wantsBreakfast = !wantsBreakfast; //cambiamos el valor de booleano
          }),
        ),
         CheckboxListTile(
          title: const Text('¿Incluir comida'),
          value: wantsLunch, //usamos los booleanos creados arriba en las variables de clase
          onChanged: (value) => setState(() { //usamos el setState para el estado
            wantsLunch = ! wantsLunch; //cambiamos el valor de booleano
          }),
        ),
         CheckboxListTile(
          title: const Text('¿Incluir cena?'),
          value: wantsDinner, //usamos los booleanos creados arriba en las variables de clase
          onChanged: (value) => setState(() { //usamos el setState para el estado
            wantsDinner = !wantsDinner; //cambiamos el valor de booleano
          }),
        ),

      ],
    );
    
  }
}