import 'package:agenda_contatos/Model/contatoService.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/cadastro.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:agenda_contatos/View/recursos/perfil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Model/contato.dart';

class Busca extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BuscaState();
}

class BuscaState extends State<Busca> {
// Objeto de Model
  ContatoService service = new ContatoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de Título
      appBar: new BarraSuperior(),

      // Menu (hambúrguer)
      drawer: new MenuDrawer(),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 75),
          itemCount: service.listarContato().length,
          itemBuilder: (BuildContext context, int index) {
            // Guarda o  retorno da lista no objeto da classe
            Contato contato = service.listarContato().elementAt(index);

            return Container(
              color: Colors.grey.shade800,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: ListTile(
                  title: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Foto (miniatura)
                      new ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          contato.foto,
                          width: 70,
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(width: 50),

                      // Nome e Fone
                      new Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            contato.nome + ' ' + contato.sobrenome,
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 24),
                          ),
                          SizedBox(height: 10),
                          new Text(contato.fone),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => new Perfil(id: contato.id,)));
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.grey,
                      size: 32,
                    ),
                  )),
            );
          }),

      // Botão flutuante (Cadastro)
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: FaIcon(
            FontAwesomeIcons.plus,
          ),
          onPressed: () {
             Navigator.push(
             context, 
             MaterialPageRoute(builder: ((context) => Cadastro())));
          }),
    );
  }
}
