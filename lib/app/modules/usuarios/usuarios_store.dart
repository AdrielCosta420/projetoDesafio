import 'package:mobx/mobx.dart';

import '../../models/user.dart';
part 'usuarios_store.g.dart';

class UsuariosStore = UsuariosStoreBase with _$UsuariosStore;

abstract class UsuariosStoreBase with Store {

  @observable
  List<User> usuariosList = [];

  @action
  void usuarioListChange(List<User> list) => usuariosList = list;


}