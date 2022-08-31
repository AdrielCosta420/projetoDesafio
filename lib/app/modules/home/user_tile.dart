// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/user.dart';
import '../../repositories/user_repository.dart';

class UserTile extends StatelessWidget {
  final User user;
  final UserRepository repository;

  const UserTile({
    Key? key,
    required this.user,
    required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = (user.avatarUrl?.isEmpty ?? true) ? const CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl!));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: const Color.fromARGB(255, 248, 169, 22),
                    onPressed: () {
                      Modular.to.pushNamed("/user", arguments: user);
                    },
                  ),
                  CircleAvatar(
                    child: avatar,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Excluir Usuário'),
                          content: const Text('Tem certeza?'),
                          actions: [
                            ElevatedButton(
                              child: const Text('Não'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                repository.delete(user);
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text(
                user.nome,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                user.email ?? '',
                style: const TextStyle(fontSize: 18),
              ),
              Text(formateDate(user.dataNascimento), style: const TextStyle(fontSize: 17)),
              Text(
                mostrarIdade(user.dataNascimento),
                style: const TextStyle(fontSize: 17),
              ),
              Text(user.celular ?? '', style: const TextStyle(fontSize: 16)),
              Text(user.apelido ?? '', style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }

  String formateDate(String? data) {
    if (data != null) {
      if (data.isNotEmpty) {
        var listData = data.split("-");
        final dia = listData[2];
        final mes = listData[1];
        final ano = listData[0];
        return "$dia/$mes/$ano";
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  DateTime calculaIdade(String? data) {
    if (data != null) {
      if (data.isNotEmpty) {
        var listData = data.split("-");
        final dia = listData[2];
        final mes = listData[1];
        final ano = listData[0];
        return DateTime(int.parse(ano), int.parse(mes), int.parse(dia));
      } else {
        return DateTime.now();
      }
    } else {
      return DateTime.now();
    }
  }

  String mostrarIdade(String? data) {
    var age = AgeCalculator.age(calculaIdade(data));
    return "Idade : ${age.years} anos";
  }
}

/*
        leading: avatar,
        title: Text(user.nome),
        subtitle: Text(user.email ?? ''),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Color.fromARGB(255, 248, 169, 22),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Excluir Usuário'),
                      content: Text('Tem certeza?'),
                      actions: [
                        ElevatedButton(
                          child: Text('Não'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text('Sim'),
                          onPressed: () {
                            Provider.of<UsersProvider>(context, listen: false)
                                .remove(user);
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )
        );*/
