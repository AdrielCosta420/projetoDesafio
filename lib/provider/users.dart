//provider para controlar esse map de usuarios, pegar o usuario a partir do indice, excluir, adicionar,etc

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_desafio/classes/user.dart';


//mixin
class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {};

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
  
  void put(User user) {
    if(user == null) {
      return;
    }

    //alterar
    if(user.id != null  &&
    _items.containsKey(user.id)) {
      _items.update(user.id!, (_) => User(
        id: user.id, 
        nome: user.nome, 
        dataNascimento: user.dataNascimento, 
        apelido: user.apelido, 
        email: user.email, 
        celular: user.celular, 
        avatarUrl: 
        user.avatarUrl));
    } else {
      //adicionar
      final id = Random().nextDouble().toString();

    _items.putIfAbsent(id, () => User(
      id: id,
      nome: user.nome,
      email: user.email,
      apelido: user.apelido,
      dataNascimento: user.dataNascimento,
      avatarUrl: user.avatarUrl,
      celular: user.celular
    ),
    );
      }
    notifyListeners();
  }

  void remove(User user) {
    if(user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();

    }
  }
}