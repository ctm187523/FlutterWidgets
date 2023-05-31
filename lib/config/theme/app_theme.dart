
import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {

  //atributos
  final int selectedColor;
  final bool isDarkmode;

  //constructor
  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
    }): assert (selectedColor >= 0, 'Selecter color must be greater than 0' ),
         assert (selectedColor < colorList.length, 
          'Selecter color must be less or equal than ${ colorList.length -1}' );

  
   //funcion que devuelve un ThemeData
    ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkmode ? Brightness.dark : Brightness.light, //si el boolean es true lo ponemos en modo oscuro en caso contrario modo light
      colorSchemeSeed: colorList[ selectedColor ],
      //ponemos las propiedades para el AppBar
      appBarTheme: const AppBarTheme(
        centerTitle: false //decimos que no este centrado por defecto en Ios en Android no lo hace por defecto
      )
    );

    //creamos un metodo que devuelve una nueva instancia de la clase AppTheme
    //el copyWith es un metodo para copiar clases, para que puedan ser cambiadas sus propiedades
    //al no ser final podemos cambiar sus propiedades
    AppTheme copyWith({

      //constuctor siempre opcionales
      int? selectedColor,
      bool? isDarkmode

      }) => AppTheme( //creamos una instancia y le pasamos los atributos si no vienen( ?? ) ya que son opcionales pasamos los mismos de la clase
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkmode: isDarkmode ?? this.isDarkmode
    );
    

}