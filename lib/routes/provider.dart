import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_desafio/database/objectbox_database.dart';
import 'package:flutter_application_desafio/repositories/user_repository.dart';
import 'package:flutter_application_desafio/repositories/user_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/change_notifier_provider.dart';

final providers = <SingleChildWidget>{
  Provider<ObjectboxDatabase>(
    create: (context) => ObjectboxDatabase(),
  ),
  ChangeNotifierProvider<UserRepositoryImpl>(
      create: (context) => UserRepositoryImpl(context.read()))
};
