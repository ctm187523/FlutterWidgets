

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//usamos StateProvier de Riverpood, sera un proveedor de un estado, tema, valor numerico, etc
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

//listado de colores inmutables, usamos el listado de colores creado en el app_theme -> config/theme/app_theme
//usamos Provider para que no se pueda cambiar, el StateProvider si se puede cambiar
//lo que queremos es obtener el listado de colores en nuestros widgets a traves del estado
final colorListProvider = Provider((ref) => colorList);

//creamos un estado para poder seleccionar los diferentes colores de la lista en theme_changer_screen
final selectedColorProvider = StateProvider((ref) => 0);

// creamos un objeto de tipo de la clase creada AppTheme, usamos StateNotifierProvider para crear un objeto, un estado mas elaborado
//el primer parametro es el nombre de la clase para controlar el estado(la creamos abajo), el segundo es el estado que vamos a tener
//puede ser un objeto, un numero, un array etc
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier() //regresamos la instancia de la clase creada abajo ThemeNotifier que es quien inicializa el tema
  );



//clase que ocupamos para mantener el estado, la instancia de la clase AppTheme
//la usamos arriba, es el controlador. hereda de StateNotifier para manterner el estado
//que es la instancia del AppTheme
class ThemeNotifier extends StateNotifier<AppTheme>{

  //constuctor
  //creamos una instancia de AppTheme con sus valores por defecto para crear el estado
  //llamamos con super al padre para establecer el estado inicial de forma sincrona, el STATE(estado) en una instancia de APPTheme, tenemos acceso
  //a los metodos y atributos de AppTheme
  ThemeNotifier() : super ( AppTheme() );

  //metodo para cambiar de dark a light
  void toggleDarkMode(){

    //usamos el metodo copyWith de la clase app_theme, para tomar una copia del estado y poder
    //modificar su estado ya que la clase app_theme sus propiedades son final, cambiamos el estado del booleano al valor opuesto
    state = state.copyWith( isDarkmode: !state.isDarkmode);
  }

  //metodo para coambiar el color del theme
  //usamos el metodo copyWith de la clase app_theme, para tomar una copia del estado y poder
  //modificar su estado ya que la clase app_theme sus propiedades son final, 
  //cambiamos el valor del indice de los colores del theme
  void changeColorIndex( int colorIndex){
    state = state.copyWith( selectedColor: colorIndex);
  }

}