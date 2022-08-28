import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_desafio/classes/classUsers.dart';

import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {

  final User user;

  const UserTile (this.user);


  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Color.fromARGB(255, 248, 169, 22),
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
            );
              },
              ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){},
              ),
        ],
        ),
      )

    );
  }
}