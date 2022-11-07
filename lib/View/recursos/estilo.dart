import 'package:flutter/material.dart';

ThemeData estilo() {
  ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: Colors.red[900],
    // appBarTheme: AppBarTheme(color: Colors.red[900]),//Colors.grey[900],
    colorScheme: ColorScheme.dark(),
   /* textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey.shade300
    ),*/


    // Botão Flutuante
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.lightBlue[50],
      foregroundColor: Colors.white,
      hoverColor: Colors.orange.shade400
    )
  );
}
