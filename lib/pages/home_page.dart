import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/pages/app_controller.dart';

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
        title: Text('Home', 
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25)
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 10, 167),
        actions: [
          Icon(Icons.home, size: 25),
          Tooltip(message: 'home page',),
          
        ],
      ),
      body: Column(
        children: [
          Center(
              child: CustomSwitch(),
              ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.person_add),
            backgroundColor: Color.fromARGB(255, 167, 10, 167),
            onPressed: (){
                setState(() {
            cont++;
            print(cont);
          });
        },
        ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
              value: AppController.instance.isDartTheme,
              onChanged: (value) {
                AppController.instance.changeTheme();
              },
            );
  }
}


/*
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
            tooltip: 'Home Page',
            iconSize: 25,
          ),
        ],
        title: Text(
          'Home',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 10, 167),
      ),*/


/*floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.person_add),
       // heroTag: Tooltip(message: 'add user') ,
        backgroundColor: Color.fromARGB(255, 167, 10, 167),
        onPressed: () {
          setState(() {
            cont++;
          });
          print(cont);
        },*/
