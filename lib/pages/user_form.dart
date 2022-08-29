import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/classes/user.dart';
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
        title: const Text('Formulário de Usuário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt_outlined),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: user.id ?? '',
                    nome: user.nome,
                    dataNascimento: user.dataNascimento ?? '',
                    apelido: user.apelido ?? '',
                    email: user.email ?? '',
                    celular: user.celular ?? '',
                    avatarUrl: user.avatarUrl ?? '',
                  ),
                );
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
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Data de Nascimento',
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
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
}
