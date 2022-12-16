import 'package:flutter/material.dart';

// Classe que usamos para transportar os dados, com se fosse um pacote que tem espaço para guardar dados
class Contato {
  int id;
  String nome;
  String sobrenome;
  String email;
  String fone;
  String foto;

  // ----Construtor----(Tornando OBRIGATÓRIO passar esses valores)
  Contato({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.fone,
    required this.email,
    required this.foto,
  });
}
