import 'package:agenda_contatos/View/busca.dart';
import 'package:agenda_contatos/View/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuDrawer extends StatelessWidget {
// Dados vindos do banco de dados(simulação)
  String usuario = 'Igor Maldonado';
  String email = 'igor_maldonado77@gmail.com';
  String fotoPerfil = 'img/foto.jpg';

  Text mostrarTitulo(String texto) {
    return Text(
      texto,
      style: TextStyle(fontSize: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //  Foto e informações do usuário
          UserAccountsDrawerHeader(
              accountName: new Text(usuario),
              accountEmail: new Text(email),
              currentAccountPictureSize: Size.fromRadius(45 ),
              currentAccountPicture: CircleAvatar
              (
                  child: ClipRRect(
                child: Image.asset(
                  fotoPerfil,
                  width: 700,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                
                borderRadius: BorderRadius.circular(50),
              ))),

           // Perfil
          new ListTile(
            title: mostrarTitulo('Perfil'),
            subtitle: Text('Editar Informações'),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(FontAwesomeIcons.userAstronaut,
            color: Colors.red.shade400,
            size: 32),

            onTap: () {
              
            },
          ), 


          ListTile(
              title: mostrarTitulo('Home'),
              subtitle: Text('Página inicial'),
              leading: FaIcon(
                FontAwesomeIcons.home,
                color: Colors.orange.shade400,
              ),
              trailing: FaIcon(FontAwesomeIcons.chevronRight),
              onTap: () {
                //  Vai para a página Home
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }),
          new ListTile(
            title: mostrarTitulo('Contatos'),
            subtitle: Text('Gerenciar contatos'),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.users,
              color: Colors.blue.shade400,
              size: 32,
            ),

            // Vai ppara a página busca 
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Busca()));
            },
          ),

         

          new ListTile(
            title: mostrarTitulo('Configurações'),
            subtitle: Text('Ajustes do sistema'),
            leading: FaIcon(
              FontAwesomeIcons.cog,
              color: Colors.teal,
              size: 32,
            ),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            onTap: (() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
          ),

          new ListTile(
            title: mostrarTitulo('logout'),
            subtitle: Text('Sair do Sistema'),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(FontAwesomeIcons.signOutAlt,
                color: Colors.grey, size: 32),

            // Vai para a página Logout
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()
                  )
                  );
            },
          )
        ],
      ),
    );
  }
}
