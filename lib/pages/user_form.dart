import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/models/user.dart';
import 'package:flutter_application_desafio/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User user;
    try {
      user = ModalRoute.of(context)?.settings.arguments as User;
    } catch (e) {
      user = User(nome: '');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 130, 37, 236),
        title: const Text('Formulário de Usuário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt_outlined),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                Provider.of<UsersProvider>(context, listen: false).put(user);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: user.nome,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome inválido.';
                    }
                    if (value.trim().length < 3) {
                      return 'Insira um nome no mínimo com 3 letras.';
                    }

                    return null;
                  },
                  onSaved: (value) => user.nome = value ?? '',
                ),
                TextFormField(
                  initialValue: user.email ?? '',
                  decoration: const InputDecoration(labelText: 'Email'),
                  onSaved: (value) => user.email = value ?? '',
                ),
                DateTimePicker(
                  type: DateTimePickerType.date,
                  dateMask: 'dd/MM/yyyy',
                  initialValue: user.dataNascimento,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  initialDate:  DateTime.now(),
                  dateLabelText: 'Data de Nascimento',
                  onChanged: (val) => user.dataNascimento = val,
                  onSaved: (val) => user.dataNascimento = val,
                ),
                TextFormField(
                  initialValue: user.celular ?? '',
                  decoration:
                      const InputDecoration(labelText: 'Número de Telefone'),
                  onSaved: (value) => user.celular = value ?? '',
                ),
                TextFormField(
                  initialValue: user.apelido ?? '',
                  decoration: const InputDecoration(
                      labelText: 'Como gosta de ser chamado'),
                  onSaved: (value) => user.apelido = value ?? '',
                ),
                TextFormField(
                  initialValue: user.avatarUrl ?? '',
                  decoration: const InputDecoration(labelText: 'AvatarUrl'),
                  onSaved: (value) => user.avatarUrl = value ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DateTime? converterData(String? data) {
    if (data != null) {
      if (data.isNotEmpty) {
        var split = data.split("-");
        int ano = int.parse(split[0]);
        int mes = int.parse(split[1]);
        int dia = int.parse(split[2]);

        return DateTime(ano, mes, dia);
      }
    }
    return null;
  }
}
