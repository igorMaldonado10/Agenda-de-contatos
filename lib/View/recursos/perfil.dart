import 'dart:developer';
import 'dart:ui';

import 'package:agenda_contatos/Model/contato.dart';
import 'package:agenda_contatos/Model/contatoService.dart';
import 'package:agenda_contatos/View/home.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Perfil extends StatelessWidget {
// Guarda o ID do Contato selecionado
  final int id;
// Construtor com o Atributo obrigatório
  Perfil({required this.id});

// Objeto da classe que contém a Busca dos contatos
  final ContatoService service = new ContatoService();

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Contato

    Contato contato = service.listarContato().elementAt(id -1);

    return Scaffold(
      //Barra de título
      appBar: new BarraSuperior(),

      //Menu (hambúrguer)
      drawer: MenuDrawer(),

      //Corpo do App
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Foto
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(contato.foto, height: 350,)],
            ),

            SizedBox(height: 25),

            // Nome
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ 
                new Text(
                contato.nome + " " + contato.sobrenome,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,  
                  // wordSpacing: 3
                ),
                
                )
              ],
            ),

            SizedBox(height: 10),

            //  Fone e E-mail
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Fone
                new Text(
                  contato.fone,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 18
                  ),
                ),

                // Email
                 new Text(
                  contato.email,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 18
                  ),
                )        
              ],
            ),

             new Container(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Divider(height: 5,),
          
            ),

            // Ações 
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // Ligar
                new Column(
                  children: [
                    new FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      color: Colors.orange.shade400,
                      size: 18,
                      ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),

                    new Text(
                      'Ligar',
                      style: TextStyle(
                      color: Colors.orange.shade400,
                      fontSize: 18,),)
                  ],            
                  ),
                // Mensagem
                new Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidCommentDots,
                      color: Colors.orange.shade400,
                      size: 22),

                    SizedBox(height: 15),

                    new Text(
                      'Mensagem',
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 18
                      ),
                      )  
                  ],
                ),

                // Vídeo
                new Column(
                  children: [
                    FaIcon(FontAwesomeIcons.video,
                    color: Colors.orange.shade400,
                    size: 28,
                    ),

                    SizedBox(height: 15),

                    new Text(
                      'Vídeo',
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 18
                      ),
                      )
                  ],
                ),

                // E-mail
                new Column(
                  children: [
                    FaIcon(FontAwesomeIcons.solidEnvelope,
                    color: Colors.orange.shade400,
                    size: 18,
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                
                new Text(
                  'E-mail',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange.shade400
                  ),
                )
                  ],
                )
              ],
            )
          ],
        ),
      ),

      //Botão flutuante
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.penToSquare),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => Home())));
          }),
    );
  }
}
