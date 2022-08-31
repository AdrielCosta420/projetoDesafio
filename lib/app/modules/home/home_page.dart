import 'package:flutter_mobx/flutter_mobx.dart';

import '../../repositories/user_repository.dart';
import '../usuarios/usuarios_store.dart';
import 'user_tile.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final UsuariosStore users = Modular.get();
  final UserRepository repository = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 130, 37, 236),
        title: const Text(
          'Lista de Usuários',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                repository.getAllUsers();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            //mostrar o tamanho da lista
            itemCount: users.usuariosList.length,
            // um método
            itemBuilder: ((context, index) => UserTile(
                  repository: repository,
                  user: users.usuariosList[index],
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 130, 37, 236),
        child: const Icon(Icons.person_add_alt_outlined),
        onPressed: () {
          Modular.to.pushNamed('/user/');
        },
      ),
    );
  }
}
