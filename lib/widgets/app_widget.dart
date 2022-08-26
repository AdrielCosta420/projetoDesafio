import 'package:flutter/material.dart';

import 'package:flutter_application_desafio/pages/home_page.dart';

import '../pages/app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance, 
      builder: (context, child) {
      return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 167, 10, 167),
        brightness: AppController.instance.isDartTheme
        ? Brightness.dark
        : Brightness.light
        
      ),
      home: const HomePage(),
    );
    },
    );
  }
}
