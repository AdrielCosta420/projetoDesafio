import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/provider/users.dart';
import 'package:flutter_application_desafio/widgets/user_tile.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 130, 37, 236),
        title: const Text(
          'Lista de Usuários',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        //mostrar o tamanho da lista
        itemCount: users.count,
        // um método
        itemBuilder: ((context, index) => UserTile(
              users.byIndex(index),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 130, 37, 236),
        child: const Icon(Icons.person_add_alt_outlined),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
        },
      ),
    );
  }
}
