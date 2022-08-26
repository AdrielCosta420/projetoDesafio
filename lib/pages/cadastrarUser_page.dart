import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/classes/classUsers.dart';

class CadastrarUserPage extends StatefulWidget {
  CadastrarUserPage({Key? key}) : super(key: key);

  @override
  State<CadastrarUserPage> createState() => _CadastrarUserPageState();
}

class _CadastrarUserPageState extends State<CadastrarUserPage> {
  Users usuarios1 = Users(
      nome: 'Adriel',
      dataNascimento: '29/10/2001',
      apelido: 'Driel',
      email: 'adrielsilva@aleatorio.com',
      celular: 85280238);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuarios'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
