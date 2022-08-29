import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/classes/user.dart';
import 'package:flutter_application_desafio/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:age_calculator/age_calculator.dart';

import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = (user.avatarUrl?.isEmpty ?? true)
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl!));

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
                    icon: Icon(Icons.edit),
                    color: Color.fromARGB(255, 248, 169, 22),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.USER_FORM,
                        arguments: user,
                      );
                    },
                  ),
                  CircleAvatar(
                    child: avatar,
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
                                Provider.of<UsersProvider>(context,
                                        listen: false)
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
              Text(
                user.nome,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                user.email ?? '',
                style: TextStyle(fontSize: 18),
              ),
              Text(user.dataNascimento ?? '', style: TextStyle(fontSize: 17)),
              Text(mostrarIdade(user.dataNascimento)),
              Text(user.celular ?? '', style: TextStyle(fontSize: 16)),
              Text(user.apelido ?? '', style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }

  DateTime calculaIdade(String? data) {
    if (data != null) {
      var listData = data.split("/");
      final dia = listData[0];
      final mes = listData[1];
      final ano = listData[2];
      return DateTime(int.parse(ano), int.parse(mes), int.parse(dia));
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
