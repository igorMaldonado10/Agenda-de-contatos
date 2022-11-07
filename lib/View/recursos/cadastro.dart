import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  State createState() => CadastroState();
  
}

class CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: new BarraSuperior(),
      drawer: new MenuDrawer(),
      body: SingleChildScrollView(
        // Formulário
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade800
          ),
          child: Column() ,
        ),
      ),
    );
  }

  // Retorna a estrutura do campo input

  // Cadastrar

  // Limpar campos
}
