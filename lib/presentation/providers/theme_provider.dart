

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