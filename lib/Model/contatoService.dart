import 'package:agenda_contatos/Model/contato.dart';

// Simulando o BANCO DE DADOS com essa class/list
class ContatoService {
  // Atributos da classe

  // Cria a lista de contatos
  // static = espécie de âncoragem que faz com que não modifique, consequentemente estático
  // 1º - Pegar da lista que já existe
  static List<Contato> contatos = [];

  // Método para Cadastrar CONTATOS na Agenda
  String cadastrarContato(Contato contato) {
    // 2º - Adicionar um novo
    contatos.add(contato);

    return 'Novo Contato: ${contato.nome} ${contato.sobrenome}';
  }

  // Método para buscar todos os Contatos registrados
  List listarContato() {
    /*contatos = [
      Contato(
          id: 1,
          nome: 'Beatriz',
          sobrenome: 'Kern',
          fone: '(55) 99988-7766',
          email: 'bia.kern@gmail.com',
          foto: 'img/fotos/1.jpg'),
      Contato(
          id: 2,
          nome: 'Vagner',
          sobrenome: 'Mancini',
          fone: '(55) 99887-7665',
          email: 'vagner.mancini@gmail.com',
          foto: 'img/fotos/2.jpg'),
      Contato(
          id: 3,
          nome: 'Meredith',
          sobrenome: 'Grey',
          fone: '(55) 98877-6655',
          email: 'greys_meredith@gmail.com',
          foto: 'img/fotos/3.jpg'),
      Contato(
          id: 4,
          nome: 'Pierre-Emerick',
          sobrenome: 'Aubameyang ',
          fone: '(55) 98776-6554',
          email: 'auba_pierre@gmail.com',
          foto: 'img/fotos/4.jpg'),
    ];*/

    return contatos;
  }
}
