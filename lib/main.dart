import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_desafio/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';


void main(List<String> args) {
  runApp( ModularApp(child: AppWidget(), module: AppModule(),));
}


