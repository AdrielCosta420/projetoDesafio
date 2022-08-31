// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'app/models/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6535800397879164698),
      name: 'User',
      lastPropertyId: const IdUid(7, 3378829604566225636),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7055866844154182569),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3002248581896838949),
            name: 'nome',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2058649025183736977),
            name: 'dataNascimento',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7700044792170340432),
            name: 'apelido',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4699081742508777419),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7445319578805041731),
            name: 'celular',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3378829604566225636),
            name: 'avatarUrl',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 6535800397879164698),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    User: EntityDefinition<User>(
        model: _entities[0],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nomeOffset = fbb.writeString(object.nome);
          final dataNascimentoOffset = object.dataNascimento == null
              ? null
              : fbb.writeString(object.dataNascimento!);
          final apelidoOffset =
              object.apelido == null ? null : fbb.writeString(object.apelido!);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email!);
          final celularOffset =
              object.celular == null ? null : fbb.writeString(object.celular!);
          final avatarUrlOffset = object.avatarUrl == null
              ? null
              : fbb.writeString(object.avatarUrl!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nomeOffset);
          fbb.addOffset(2, dataNascimentoOffset);
          fbb.addOffset(3, apelidoOffset);
          fbb.addOffset(4, emailOffset);
          fbb.addOffset(5, celularOffset);
          fbb.addOffset(6, avatarUrlOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User(
              nome: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              dataNascimento: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              apelido: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              celular: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              avatarUrl: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[0].properties[0]);

  /// see [User.nome]
  static final nome = QueryStringProperty<User>(_entities[0].properties[1]);

  /// see [User.dataNascimento]
  static final dataNascimento =
      QueryStringProperty<User>(_entities[0].properties[2]);

  /// see [User.apelido]
  static final apelido = QueryStringProperty<User>(_entities[0].properties[3]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[0].properties[4]);

  /// see [User.celular]
  static final celular = QueryStringProperty<User>(_entities[0].properties[5]);

  /// see [User.avatarUrl]
  static final avatarUrl =
      QueryStringProperty<User>(_entities[0].properties[6]);
}
