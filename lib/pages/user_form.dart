import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

    final _form = GlobalKey<FormState>(); 
    final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuários'),
        actions: [
          IconButton(onPressed: () {
            final isValid = _form.currentState?.validate();

            if(isValid == true && isValid != null) {
            _form.currentState?.save();
            Navigator.of(context).pop();
            } 
          },
          icon: Icon(Icons.save_alt_outlined),
          ),
        ], 
        ),
        body: Padding(padding: EdgeInsets.all(18),
        child: Form(
          key: _form,
          child: Column(
            children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
              validator: (value) {
                return "Ocorreu um erro";
              },
              onSaved: (value){
                print(value);
              }
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Data de Nascimento'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Número de Telefone'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Como gosta de ser chamado'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'AvatarUrl'),
            ),
        ]
        ,),
        ),
        ),
      );
  }
}