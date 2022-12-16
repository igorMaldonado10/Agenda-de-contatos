import 'package:agenda_contatos/Model/contato.dart';
import 'package:agenda_contatos/Model/contatoService.dart';
import 'package:agenda_contatos/View/busca.dart';
import 'package:agenda_contatos/View/recursos/barraSuperior.dart';
import 'package:agenda_contatos/View/recursos/menu.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  State createState() => CadastroState();
}

class CadastroState extends State<Cadastro> {
  final nome = TextEditingController();
  final sobrenome = TextEditingController();
  final email = TextEditingController();
  final fone = TextEditingController();
  final foto = TextEditingController();

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
          // (BoxDecoration = Add cor no nosso container, borda etc)
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade800),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Título
              new Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: new Text(
                  'Cadastro de Contato',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 24),
                ),
              ),

              // Inputs(campos do formulário)
              //Campo de texto (nome)
              new Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  // Atributo que recebe valor do campo
                  controller: nome,

                  decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Dica: preencha todos os campos',
                      labelStyle:
                          TextStyle(color: Colors.grey.shade300, fontSize: 18),

                      // Borda do Input
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),

                      // Borda selecionada
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)
                          )
                          ),
                ),
              ),

              // Campo de textto (Sobrenome)
              campTexto('Sobrenome', sobrenome),

              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Divider(
                  height: 15,
                ),
              ),

              // Campo de texto (email)
              campTexto('Email', email),

              // Campo de texto (email)
              campTexto('Fone', fone),

              // Campo de texto (foto)
              campTexto('Foto', foto),

              SizedBox(height: 15),

              //------Botões------

              // ignore: unnecessary_new
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão Cadastrar
                  // ignore: unnecessary_new
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: new Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),

                        // Cor do Botão
                        style: ElevatedButton.styleFrom(primary: Colors.orange),

                        // Ao pressionar ele, eu vou chamar o método cadastrar
                        onPressed: () {
                          cadastrar();
                        });
                  }),

                  // Botão Limpar
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: new Text(
                            'Limpar',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade600),
                        onPressed: () {
                          limpar();
                        });
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Retorna a estrutura do campo input

  Container campTexto(String title, final controller) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(color: Color.fromRGBO(224, 224, 224, 1), fontSize: 18),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange))),
      ),
    );
  }

  // Cadastrar
  void cadastrar() {
    ContatoService service = new ContatoService();

    // Guardar o último ID cadastrado
    int ultimoID = service.listarContato().length;

    Contato contato = new Contato(
        id: ultimoID +1,
        nome: nome.text,
        sobrenome: sobrenome.text,
        fone: fone.text,
        email: email.text,
        foto: foto.text);

    // Envia o objeto preenchido para adicionar a lista
    String mensagem = service.cadastrarContato(contato);

    // Mostra a mensagem com SnackBar
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(
        mensagem,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade300),
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey.shade800,
    )
    );

    // Redireciona para a tela de busca
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Busca())));
    });
  }

  // Limpar campos
  void limpar() {
    this.nome.text = "";
    this.sobrenome.text = "";
    this.email.text = "";
    this.fone.text = "";
    this.foto.text = "";
  }
}
