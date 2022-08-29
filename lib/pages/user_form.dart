import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/classes/classUsers.dart';
import 'package:flutter_application_desafio/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['nome'] = user.nome;
    _formData['email'] = user.email;
    _formData['dataNascimento'] = user.dataNascimento;
    _formData['celular'] = user.celular;
    _formData['apelido'] = user.apelido;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.save_alt_outlined),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                if (_formData.isNotEmpty) {
                  Provider.of<UsersProvider>(context, listen: false).put(
                    User(
                      id: _formData['id'] ?? '',
                      nome: _formData['nome'] ?? '',
                      dataNascimento: _formData['dataNascimento'] ?? '',
                      apelido: _formData['apelido'] ?? '',
                      email: _formData['email'] ?? '',
                      celular: _formData['celular'] ?? '',
                      avatarUrl: _formData['avatarUrl'] ?? '',
                    ),
                  );
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome inválido.';
                  }
                  if (value.trim().length < 3) {
                    return 'Insira um nome no mínimo com 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['nome'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['dataNascimento'],
                decoration: InputDecoration(labelText: 'Data de Nascimento'),
                onSaved: (value) => _formData['dataNascimento'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['celular'],
                decoration: InputDecoration(labelText: 'Número de Telefone'),
                onSaved: (value) => _formData['celular'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['apelido'],
                decoration:
                    InputDecoration(labelText: 'Como gosta de ser chamado'),
                onSaved: (value) => _formData['apelido'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'AvatarUrl'),
                onSaved: (value) => _formData['avatarUrl'] = value ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
