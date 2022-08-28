import 'package:flutter/material.dart';

class User {
  final String? id;
  final String nome;
  final String dataNascimento;
  final String apelido;
  final String email;
  final String celular;
  final String avatarUrl;

  const User({
    required this.id,
    required this.nome,
    required this.dataNascimento,
    required this.apelido,
    required this.email,
    required this.celular,
    required this.avatarUrl,
  });


}
