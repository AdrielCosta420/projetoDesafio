import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/classes/classUsers.dart';
import 'package:flutter_application_desafio/dados/dados_users.dart';
import 'package:flutter_application_desafio/pages/cadastrarUser_page.dart';
import 'package:flutter_application_desafio/widgets/user_tile.dart';

import '../widgets/custom_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    final Users = {...DADOS_USERS};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'
          ),
          centerTitle: true,
          
        ),
      body: ListView.builder(
        //mostrar o tamanho da lista
        itemCount: Users.length,
        // um método
        itemBuilder: ((context, index) => UserTile(Users.values.elementAt(index))),
        ),
    floatingActionButton: FloatingActionButton( 
      child:
      const Icon(Icons.person_add),
      onPressed: () {  },),
    );
  }
}
        
      
    /* floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 1, 1, 2),
        onPressed: () {
          setState(() {
            cont++;
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CadastrarUserPage(),
            ));
          });
        },
        child: const Icon(Icons.person_add),
      ),*/
    
