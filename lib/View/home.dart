import 'dart:ui';

import 'package:agenda_contatos/View/busca.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Título do app
      appBar: new BarraSuperior(),

      // Menu
      drawer: new MenuDrawer(),

      // Corpo do App
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  new SizedBox(height: 25), //Espaçamento

            // Título
            new Container(
              alignment: Alignment.center,
              // color: Colors.blue,
              // padding: EdgeInsets.all(25),
              padding: EdgeInsets.fromLTRB(25, 50, 25, 25),
              child: Column(
                children: [
                  // Título
                  new Text('Buenas, o que vamos fazer?',
                      style:
                          TextStyle(color:
                           Colors.grey.shade300,
                            fontSize: 24)),

                  new SizedBox(height: 45), //Espaçamento

                  // Botão Buscar Contato
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              new FaIcon(FontAwesomeIcons.search,
                                  size: 24, color: Colors.white),

                              //  SizedBox(width: 25),

                              new Text('Buscar Contatos',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24))

                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange[800]),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                              (context) => new Busca()));
                        });
                  }),

                  SizedBox(height: 15),

                  // Botão Cadastrar
                  new Builder(builder: (BuildContext context) {
                    return new ElevatedButton(
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.all(16),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new FaIcon(
                              FontAwesomeIcons.plus,
                              size: 24,
                              color: Colors.white),

                              new Text('Cadastrar Contato',
                               style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                               )),   
                          ]
                        )
                      ),

                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
