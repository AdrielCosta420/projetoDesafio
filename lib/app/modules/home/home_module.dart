import '../../database/objectbox_database.dart';
import '../../repositories/user_repository.dart';
import '../../repositories/user_repository_impl.dart';
import '../usuarios/usuarios_store.dart';
import 'home_Page.dart';
import 'home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {




  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => UsuariosStore()),
    Bind.lazySingleton((i) => ObjectboxDatabase()),
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(i.get(),i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
