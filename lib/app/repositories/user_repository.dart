

import 'package:flutter_application_desafio/app/models/user.dart';

abstract class UserRepository {
  Future<void> save(User user);
  Future<void> update(User user);
  Future<void> delete(User user);
  Future<List<User>> getAllUsers();
}
