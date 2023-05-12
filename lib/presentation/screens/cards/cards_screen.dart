
import 'package:flutter/material.dart';


//creamos un Map para los atraibutos de las tarjetas que seran la elevacion y el label
const cards = <Map<String,dynamic>>[
  { 'elevation': 0.0, 'label': 'Elevation 0'},
  { 'elevation': 1.0, 'label': 'Elevation 1'},
  { 'elevation': 2.0, 'label': 'Elevation 2'},
  { 'elevation': 3.0, 'label': 'Elevation 3'},
  { 'elevation': 4.0, 'label': 'Elevation 4'},
  { 'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {

  //ponemos los name para el routing de go_route es opcional
  //lo ponemos estatico para poder acceder de las configuraciones de las rutas en  el archivo go_router.dart creado
  static const String name = 'cards_screen';

  //constructor
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardView(),
    );
  }
}

class _CardView extends StatelessWidget {
  const _CardView();

  @override
  Widget build(BuildContext context) {
    //usamos SingleChildScrollView para que si sobre pasa el height de la pantalla cree un scroll
    return SingleChildScrollView(
      child: Column(
        children: [
          // usamos el spread ... para barrer las tarjetas de arriba y al usar map 
          //creamos un nuevo arreglo, y mapeamos el Map creado arriba y le asignamos los 
          //valores a las tarjetas usando la clase _CardType1 creada abajo
          ...cards.map(
            (card) => _CardType1(label: card['label'], elevation: card['elevation']),
          ),
           ...cards.map(
            (card) => _CardType2(label: card['label'], elevation: card['elevation']),
          ),

           ...cards.map(
            (card) => _CardType3(label: card['label'], elevation: card['elevation']),
          ),

            ...cards.map(
            (card) => _CardType4(label: card['label'], elevation: card['elevation']),
          ),

        //damos un margen al de 50 al final del scroll de todos los cards
         const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  
  //atributos
  final String label;
  final double elevation;

  //constructor
  const _CardType1({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    //usamos el Widget Card oara crear la tarjeta
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

//Card con borde
class _CardType2 extends StatelessWidget {
  
  //atributos
  final String label;
  final double elevation;

  //constructor
  const _CardType2({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    //usamos el Widget Card oara crear la tarjeta
    return Card(
      //ponemos un borde al card
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}


//tarjeta con fondo
class _CardType3 extends StatelessWidget {
  
  //atributos
  final String label;
  final double elevation;

  //constructor
  const _CardType3({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    //usamos el Widget Card oara crear la tarjeta
    return Card(
      color:colors.surfaceVariant, //le damos un color de fondo
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}

//tarjeta con imagen
class _CardType4 extends StatelessWidget {
  
  //atributos
  final String label;
  final double elevation;

  //constructor
  const _CardType4({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    //usamos el Widget Card oara crear la tarjeta
    return Card(
      clipBehavior: Clip.hardEdge, //pone los bordes a la tarjeta
      elevation: elevation,
      child: Stack(
        children: [
          //colocamos la imagen de internet, y le damos la elevation
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350, //le damos la altura
            fit: BoxFit.cover, //le decimos como queremos que la imagen se adapte a su espacio, se adapta al padre
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              //decoramos los el boton de lo 3 puntos de arriba para que se visualize bien
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20))
              ),
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}