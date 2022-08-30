// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:flutter_application_desafio/database/objectbox_database.dart';
import 'package:flutter_application_desafio/models/user.dart';
import 'package:flutter_application_desafio/repositories/user_repository.dart';

class UserRepositoryImpl with ChangeNotifier implements UserRepository {
  late final ObjectboxDatabase _database;

  UserRepositoryImpl(
    this._database,
  );
  @override
  Future<void> delete(User user) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<void> save(User user) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
