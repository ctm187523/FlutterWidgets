import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//importamos el paquete animate_do de Fernado herrera con -> flutter pub add animate_do 
//para manejar las animaciones, en este caso para que el boton de comenzar tenga un funcionamiento 
//mas suave al aparecer

//creamos una clase para los slides
class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  //constructor posicional
  SlideInfo(this.title, this.caption, this.imageUrl);
}

//creamos un array de tipo de la clase de arrina para crear 3 slides
final slides = <SlideInfo>[

  //hacemos instancias de la clase creda arriba
  SlideInfo('Busca la comida', 'Laboris laborum ea esse consectetur consequat consectetur.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Qui eu exercitation in enim cupidatat cupidatat.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Deserunt aliquip enim proident do elit eu eu exercitation nulla veniam elit veniam occaecat elit.', 'assets/images/3.png'),
];


//usamos un StatefulWidget para manejar el estado, lo usamos para el controller para saber que lugar
//ocupan los slides
class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorialScreen';
 
  //constructor
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  //creamos una propiedad de clase de tipo PageController para usarla en el controller,para manejar el 
  //posicionamiento de los slides
  final PageController pageViewController = PageController();
  bool endReached = false; //booleano para saber cuando se llega al ultimo slide

  //agregamos un listener al objeto de arriba PageController para saber si se esta moviendo, que slide, totalidad del espacio, etc
  //creamos un ciclo de vida
  @override
  void initState() {
    super.initState();

    //creamos el listener
  pageViewController.addListener(() {

    //print('${ pageViewController.page}'); //creamos el print para saber en que lugar se encuentra el slide descomentar para verlo en consola
    final page = pageViewController.page ?? 0; //en la variable page almacenamos en que slide se encuentra en caso contrario es cero si el controlador aun no se ha asignado al widget
    //ponemos la condicion de si endReached es false(no ha llegado al final) y el slides enta en el punto 1.5
    //es decir a punto de llegar al ultimo slide, llamamos al setState para cambiar el valor del booleano endReached
    if ( !endReached && page >= (slides.length - 1.5)){

      setState(() {
        endReached = true;
      });
    }
  });
  }

  //creamos el ciclo de vida dispose para limpiar los listener
  @override
  void dispose() {
    pageViewController.dispose();
   super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     //usamos un Stack para poner widgets encima de otros en nuestro caso el PageView y el positioned con el textButton
      body: Stack(
        children: [
          //usamos el widget PageView
          PageView(
            //usamos un controller para mostrar el posicionamiento de los slides
            controller: pageViewController, //usamos la propiedad creada arriba
            physics: const BouncingScrollPhysics(),
            //en el children mapeamos los slides creados arriba y los usamos para crear
            // instancias de la clase de abajo _Slide
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
                )
              ).toList(), //lo convertimos a una lista el iterable que es lo que pide el children
          ),
          //usamos el positioned para posicionar un TextButton para salir almenu principal
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(), //usamos el context.pop() del go_router para salir y ir al menu principal
            )
          ),
          //usamos otro Positioned para colocar un boton abajo del ultimo slide de comenzar solo en el caso
          //de que el booleano endReached sea true en caso contrario mosntramos un SizeBox vacio
          endReached ? 
          Positioned(
            bottom: 30,
            right: 30,
            //usamos el FadeInRight importado arriba para animaciones de Fernando Herrera
            child: FadeInRight(
              from: 15, //propiedad de la animacion de FadeInRight
              delay: const Duration(seconds: 1), //propiedad de la animacion de FadeInRight
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar')),
            ) 
          ):const SizedBox()
        ],
      ),
    );
  }
  
}

//creamos una clase para manejar los slides
class _Slide extends StatelessWidget {

  //variables de clase
  final String title;
  final String caption;
  final String imageUrl;

  //constructor
  const _Slide({
   required this.title, 
   required this.caption,
   required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    //propiedades de clase para estilizar el titulo y el caption usados abajo
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          //alineamiento vertical
          mainAxisAlignment: MainAxisAlignment.center,
          //alineamiento horizontal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage( imageUrl)),
            const SizedBox(height: 20),
            Text( title, style: titleStyle), //usamos el estilo creado arriba
            const SizedBox(height: 10),
            Text( caption, style: captionStyle,) //usamos el estilo creado arriba
          ],
      ),
    ),
    );
  }
}