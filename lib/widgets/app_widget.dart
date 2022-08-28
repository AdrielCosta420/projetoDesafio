import 'package:flutter/material.dart';

import '../pages/app_controller.dart';
import '../pages/home_page.dart';

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
