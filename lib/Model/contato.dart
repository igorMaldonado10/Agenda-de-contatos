import 'package:flutter/material.dart';

class Contato {
  int id;
  String nome;
  String sobrenome;
  String email;
  String fone;
  String foto;

  // Construtor
  Contato({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.fone,
    required this.email,
    required this.foto,
  });
}
