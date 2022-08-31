// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_desafio/app/modules/usuarios/usuarios_store.dart';
import 'package:flutter_application_desafio/app/repositories/user_repository.dart';
import '../database/objectbox.g.dart';
import '../database/objectbox_database.dart';
import '../models/user.dart';

class UserRepositoryImpl with ChangeNotifier implements UserRepository {
  late final ObjectboxDatabase _database;
  final UsuariosStore storeUsuario;

  UserRepositoryImpl(this._database, this.storeUsuario);

  Future<Box> getBox() async {
    final store = await _database.getStore();
    return store.box<User>();
  }

  @override
  Future<void> delete(User user) async {
    var store = await _database.getStore();
    var box = store.box<User>();
    box.remove(user.id);
    final usuarios = box.getAll();
    storeUsuario.usuarioListChange(usuarios);
  }

  @override
  Future<List<User>> getAllUsers() async {
    var store = await _database.getStore();
    var box = store.box<User>();
    final usuarios = box.getAll();
    storeUsuario.usuarioListChange(usuarios);
    return usuarios;
  }

  @override
  Future<void> save(User user) async {
    var store = await _database.getStore();
    var box = store.box<User>();
    box.put(user);
    final usuarios = box.getAll();
    storeUsuario.usuarioListChange(usuarios);
  }

  @override
  Future<void> update(User user) async {
    var store = await _database.getStore();
    var box = store.box<User>();
    box.put(user);
    final usuarios = box.getAll();
    storeUsuario.usuarioListChange(usuarios);
  }
}
