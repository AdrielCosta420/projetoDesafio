import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;
  bool isDartTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            tooltip: 'Menu Icon',
            iconSize: 35,
          ),
        ],
        title: Text(
          'Usuários',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 10, 167),
      ),
      body: Center(
          child: Switch(
              value: isDartTheme,
              onChanged: (value) {
                setState(() {
                  isDartTheme = value;
                });
              })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 167, 10, 167),
        onPressed: () {
          setState(() {
            cont++;
          });
          print(cont);
        },
      ),
    );
  }
}
