import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  //? NÃO PERMITIR QUE A CLASSE SEJA INSTÂNCIADA com construtor privado ._();
  FilmesAppUiConfig._();

  //* atributo do tipo GET -> title

  static String get title => 'Filmes App';
  static ThemeData get theme => ThemeData(
        fontFamily: 'Metropolis',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
}
