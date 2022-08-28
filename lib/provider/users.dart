//provider para controlar esse map de usuarios, pegar o usuario a partir do indice, excluir, adicionar,etc

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_desafio/classes/classUsers.dart';
import 'package:flutter_application_desafio/dados/dados_users.dart';

//mixin
class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DADOS_USERS};

  //metodos
  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }
}