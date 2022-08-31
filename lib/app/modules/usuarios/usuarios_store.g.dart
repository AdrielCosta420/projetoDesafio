// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarios_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsuariosStore on UsuariosStoreBase, Store {
  late final _$usuariosListAtom =
      Atom(name: 'UsuariosStoreBase.usuariosList', context: context);

  @override
  List<User> get usuariosList {
    _$usuariosListAtom.reportRead();
    return super.usuariosList;
  }

  @override
  set usuariosList(List<User> value) {
    _$usuariosListAtom.reportWrite(value, super.usuariosList, () {
      super.usuariosList = value;
    });
  }

  late final _$UsuariosStoreBaseActionController =
      ActionController(name: 'UsuariosStoreBase', context: context);

  @override
  void usuarioListChange(List<User> list) {
    final _$actionInfo = _$UsuariosStoreBaseActionController.startAction(
        name: 'UsuariosStoreBase.usuarioListChange');
    try {
      return super.usuarioListChange(list);
    } finally {
      _$UsuariosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuariosList: ${usuariosList}
    ''';
  }
}
