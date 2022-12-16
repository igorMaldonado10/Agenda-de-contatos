import 'package:flutter/material.dart';

ThemeData estilo() {
  ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: Colors.grey[900],
    appBarTheme: AppBarTheme(color: Colors.grey[900]),//Colors.grey[900],
    colorScheme: ColorScheme.dark(),
    // Ao selecionar o campo de texto
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey.shade300
    ),


    // Botão Flutuante
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.orange[500],
      foregroundColor: Colors.white,
      hoverColor: Colors.lightBlue[50]
    )
  );
}
