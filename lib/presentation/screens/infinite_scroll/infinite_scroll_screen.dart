
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//usamos el StatefulWidget para manejar los estados
class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';
  
  //constructor
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  //creamos una lista de enteros que seran los ids de las imagenes
  List<int> imagesIds = [1,2,3,4,5];

  //creamos un objeto ScrollController para manejar el estado del scroll y que al
  //llegar a las 5 primeras imagenes cargue otras 5 imagenes mas
  final ScrollController scrollController = ScrollController();
  bool isloading = false; //variable que usamos en el metodo de abajo loadNextPage
  bool isMounted = true; //vemos si esta montado el componente / widget
  

  //creamos los estados initState y dispose, en el initState llamamos al listener
  //para manejar el estado del Scroll y en dispose lo limpiamos
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      //tenemos que determinar cuando el scroll esta al final
      //con scrollController.position.pixels nos dice la posicion donde nos encontramos le sumamos 500 para
      //darle um margen que se ejecute antes de que llegue al final y con scrollController.position.maxScrollExtent
      //determinamos cuando en scroll esta al final si es mayor como damos 500 pixeles de margen quiere decir
      //que quedan 500 pixeles para llegar al final del scroll
      if( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        //usamos el metodo creado abajo
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false; //ponemos el bool en false ya que se destruye el widget
    super.dispose();
  }

  //simulamos una labor asincrona
  Future loadNextPage() async {

    if( isloading ) return; //si esta en true salimos quiere decir  que ya esta haciendo la peticion
    isloading = true;
    //usamos el setState para redibujar en la panatalla
    setState(() {});

    await Future.delayed(const Duration( seconds: 2));
    //llamamos al metodo addFiveImages para que agregue mas ids al array
    addFiveImages();
    isloading = false;
    //volvemos a redibujar, comprobando primero si esta montado el componente/widget
    //para evitar que si me salgo de la pantalla actual como la carga es asincrona puedo
    //llamar a un state de un widget que ya no existe, que no esta montado en el contexto
    if(!isMounted) return;
    setState(() {});
    moveScrollToBotoom(); //llamamos al metodo creado abajo
  }

  //metodo para que al llegar al final hago un scroll automatico para mostrar que
  //la persona sepa que hay mas contenido que ver, se muestra automaticamente la imagen que vendria
  //acontinuacion despues de la carga de imagenes
  void moveScrollToBotoom() {

    //comprobamos que el usuario no se encuentra a mas de 150 pixeles del final, para que 
    //si esta en una poscion mas arriba del final no vaya directamente al final, controlamos que 
    //el usuario este cerca del final del scroll
    if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
     scrollController.position.pixels +120, //le decimos que vaya de la posicion actual 120 pixeles mas abajo
     duration: const Duration(milliseconds: 300),
     curve: Curves.fastOutSlowIn //efecto
    );
  }
  
  //metodo que usamos para manejar el RefreshIndicator de abajo para 
  //cuando hagamos un refresh(tirando el scroll hacia abajo, cuando estamos al inicio a los 3 segundos muestre nuevas imagenes)
  Future<void> onRefresh() async {
    isloading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if( !isMounted ) return; //si no esta montado salimos para evitar errores

    isloading = false;
    final lastId = imagesIds.last; //obtenemos el ultimoId
    imagesIds.clear(); //limpiamos el array con los ids
    imagesIds.add(lastId +1); //agregamos el ultimoId + 1
    addFiveImages(); //llamamos al meetodo addFiveImages de abajo para que añada 5 nuevos ids a partir del ultimoId
   
    setState(() {}); //usamos el setState para que se realizen los cambios de estado
  }

  //metodo para añadir mas imagenes al array de arriba imagesId, cuando voy avanzando el scroll
  void addFiveImages() {
    final lastId = imagesIds.last; //obtenemos el ultimo id del array imagesId
    //añadimos 5 nuevos valores al array imagesId
    imagesIds.addAll(
      //el e son los valores 1,2,3,4,5 del array creado abajo, 
      //le añadimos al ultimo id los valore(1,2,3,4,5) con esto añadimos 5 valores mas al array imagesId
      //al inicio si lastId vale 5 sera -> 5+1 = 6, 5+2 = 7, 5 +3 = 8,etc
      [1,2,3,4,5].map((e) => lastId + e) 
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
      //usamos el MediaQuery.removePadding para quitar el espacio que queda arriba antes de que muestre el listado de imagebes
      MediaQuery.removePadding(
        context: context,
        removeTop: true, //borramos el espacio de arriba que hay antes de la imagenes
        removeBottom: true, //borramos el espacio de abajo que hay antes de la imagenes
        //usamos el widget ListView.builder ya que crearemos las imagenes bajo demanda
        //no lo tenemos en memoria
        child: RefreshIndicator(
          onRefresh: onRefresh, //llamamos al metodo creado arriba onRefresh 
          edgeOffset: 10, //ponemos un margen 
          strokeWidth: 2, //ponemos un margen
          child: ListView.builder(
            controller: scrollController, //usamos el objeto ScrollController creado arriba para manejar el estado del Scroll, bindeamos con el listener creado arriba
            itemCount: imagesIds.length, //usamos el List creado arriba para poner los ids que contendra el ListView
            itemBuilder: (context, index){
              //usamos un FadeInImage que nos permite cargar una imagen y mientras se carga mostrar un placeholder com un gif que muestra la cargad de las imagenes
                return FadeInImage(
                  fit: BoxFit.cover, //usamos el fit para que tome el espacio en blanco entre las imagenes
                  width: double.infinity,
                  height: 300,
                  //para el placeholder usamos el gif de los assets
                  placeholder: const AssetImage('assets/images/jar-loading.gif'),
                  //para la imagen usamos una url donde el id es el List omagesIds creado arriba y 500 y 300 son las dimensiones de la imagen
                   image: NetworkImage('https://picsum.photos/id/${ imagesIds[index]}/500/300'),
                  );
            }),
        ),
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(), //al pulsarlo va al menu principal
          child: 
          //ponemos uan condicion de que si no esta cargando muestre el boton con la flecha de volver
          //en caso contrario el boton muestra el icono de que esta cargando las imagenes
          !isloading 
          ?
            FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)) //usamos el efecto de Fernado herrera FadeIn para que sea mas suave
          :
            SpinPerfect(  //usamos el paquete de Fernando herrera para las animaciones
              infinite: true, //decimos que siempre gire
              child: const Icon(Icons.refresh_rounded) //usamos un icono que nos indica que se estan cargando las imagenes
            ) 
        ),
    );
  }
}
