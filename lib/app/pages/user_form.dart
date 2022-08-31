import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_application_desafio/app/models/user.dart';
import 'package:flutter_application_desafio/app/modules/users/users_store.dart';
import 'package:flutter_application_desafio/app/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  final String title;
  const UsersPage({Key? key, this.title = 'UsersPage'}) : super(key: key);
  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  final _form = GlobalKey<FormState>();
  final UsersStore store = Modular.get();
  final UserRepository repository = Modular.get();
  late User user;

    

    @override
  void initState() {
    super.initState();
    try {
      user = Modular.args.data as User;
    } catch (e) {
      user = User(nome: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 130, 37, 236),
        title: const Text('Formulário de Usuário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt_outlined),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                repository.save(user);
                Modular.to.pop();
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
                  icon: const Icon(Icons.event),
                  initialDate: DateTime.now(),
                  dateLabelText: 'Data de Nascimento',
                  onChanged: (val) => user.dataNascimento = val,
                  onSaved: (val) => user.dataNascimento = val,
                ),
                TextFormField(
                  initialValue: user.celular ?? '',
                  decoration: const InputDecoration(labelText: 'Número de Telefone'),
                  onSaved: (value) => user.celular = value ?? '',
                ),
                TextFormField(
                  initialValue: user.apelido ?? '',
                  decoration: const InputDecoration(labelText: 'Como gosta de ser chamado'),
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
