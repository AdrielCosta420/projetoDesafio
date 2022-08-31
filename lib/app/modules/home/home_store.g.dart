// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$listaUsuariosAtom =
      Atom(name: 'HomeStoreBase.listaUsuarios', context: context);

  @override
  List<dynamic> get listaUsuarios {
    _$listaUsuariosAtom.reportRead();
    return super.listaUsuarios;
  }

  @override
  set listaUsuarios(List<dynamic> value) {
    _$listaUsuariosAtom.reportWrite(value, super.listaUsuarios, () {
      super.listaUsuarios = value;
    });
  }

  @override
  String toString() {
    return '''
listaUsuarios: ${listaUsuarios}
    ''';
  }
}
