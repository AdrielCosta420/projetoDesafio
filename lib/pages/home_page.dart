import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/pages/cadastrarUser_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 25)),
        centerTitle: true,
        leading: InkWell(
          onTap: () => {},
          child: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: const [
          Center(
            child: const CustomSwitch(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 42, 140, 206),
        onPressed: () {
          setState(() {
            cont++;
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CadastrarUserPage(),
            ));
          });
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
