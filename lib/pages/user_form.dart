import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuários'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.save_alt_outlined)),
        ],
        ),
      );
  }
}